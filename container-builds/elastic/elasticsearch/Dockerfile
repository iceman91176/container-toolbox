ARG elasticsearch_image = elasticsearch
ARG elasticsearch_version = 7.4.0
FROM docker.elastic.co/elasticsearch/${elasticsearch_image}:${elasticsearch_version}

RUN bin/elasticsearch-plugin install --batch analysis-phonetic; \
    bin/elasticsearch-plugin install --batch analysis-icu
