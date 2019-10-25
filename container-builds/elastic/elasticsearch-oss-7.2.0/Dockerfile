FROM docker.elastic.co/elasticsearch/elasticsearch-oss:7.2.0

RUN bin/elasticsearch-plugin install --batch analysis-phonetic; \
    bin/elasticsearch-plugin install --batch analysis-icu
