FROM opensearchproject/opensearch:2.2.1

RUN "./bin/opensearch-plugin intall --batch analysis-icu"