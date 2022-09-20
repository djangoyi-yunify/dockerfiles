FROM opensearchproject/opensearch:2.2.1

ARG EXPORTERURL=https://github.com/aiven/prometheus-exporter-plugin-for-opensearch/releases/download/2.2.1.0/prometheus-exporter-2.2.1.0.zip
ARG ANALYSISIKURL=https://github.com/aparo/opensearch-analysis-ik/releases/download/2.2.1/opensearch-analysis-ik-2.2.1.zip

WORKDIR /usr/share/opensearch
RUN /bin/bash -c "./bin/opensearch-plugin install --batch analysis-icu && ./bin/opensearch-plugin install --batch analysis-kuromoji && ./bin/opensearch-plugin install --batch analysis-nori && ./bin/opensearch-plugin install --batch analysis-phonetic && ./bin/opensearch-plugin install --batch analysis-smartcn && ./bin/opensearch-plugin install --batch analysis-stempel && ./bin/opensearch-plugin install --batch analysis-ukrainian && ./bin/opensearch-plugin install --batch mapper-annotated-text && ./bin/opensearch-plugin install --batch mapper-murmur3 && ./bin/opensearch-plugin install --batch mapper-size && ./bin/opensearch-plugin install --batch repository-hdfs && ./bin/opensearch-plugin install --batch repository-s3 && ./bin/opensearch-plugin install --batch ingest-attachment && ./bin/opensearch-plugin install --batch $EXPORTERURL && ./bin/opensearch-plugin install --batch $ANALYSISIKURL"

COPY plugin.policy config/

RUN /bin/bash -c "echo -Djava.security.policy=/usr/share/opensearch/config/plugin.policy >> /usr/share/opensearch/config/jvm.options"