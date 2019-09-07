FROM docker.elastic.co/elasticsearch/elasticsearch:7.0.0

RUN mkdir backup

RUN chown -R elasticsearch:elasticsearch backup
