# Bind paths /var/solr/data
FROM alpine/git as git
RUN mkdir /opt/mir-solr
WORKDIR /opt/
RUN git --version && \
    git clone --recursive https://github.com/MyCoRe-Org/mir-solr.git
FROM solr:7
COPY --from=git --chown=solr:solr /opt/mir-solr/ /opt/solr/server/solr/
USER root
# patch solr manually to mitigate CVE-2021-44228
ADD https://repo1.maven.org/maven2/org/apache/logging/log4j/log4j-core/2.16.0/log4j-core-2.16.0.jar /opt/solr/server/lib/ext/log4j-core-2.16.0.jar
ADD https://repo1.maven.org/maven2/org/apache/logging/log4j/log4j-slf4j-impl/2.16.0/log4j-slf4j-impl-2.16.0.jar /opt/solr/server/lib/ext/log4j-slf4j-impl-2.16.0.jar
ADD https://repo1.maven.org/maven2/org/apache/logging/log4j/log4j-api/2.16.0/log4j-api-2.16.0.jar /opt/solr/server/lib/ext/log4j-api-2.16.0.jar
ADD https://repo1.maven.org/maven2/org/apache/logging/log4j/log4j-1.2-api/2.16.0/log4j-1.2-api-2.16.0.jar /opt/solr/server/lib/ext/log4j-1.2-api-2.16.0.jar
RUN rm /opt/solr/server/lib/ext/log4j-core-2.11.0.jar &&\
    rm /opt/solr/server/lib/ext/log4j-api-2.11.0.jar &&\
    rm /opt/solr/server/lib/ext/log4j-slf4j-impl-2.11.0.jar &&\
    rm /opt/solr/server/lib/ext/log4j-1.2-api-2.11.0.jar
RUN chown $SOLR_USER -R /opt/solr/server/lib/ext/*
ENV INIT_SOLR_HOME "yes"
ENV SOLR_HOME "/var/solr-data"/
CMD ["solr-foreground", "-force"]
