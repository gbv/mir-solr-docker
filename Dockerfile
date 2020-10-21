# Bind paths /var/solr/data
FROM alpine/git as git
RUN mkdir /opt/mir-solr
WORKDIR /opt/
RUN git --version && \
    git clone --recursive https://github.com/MyCoRe-Org/mir-solr.git
FROM solr:7
COPY --from=git --chown=solr:solr /opt/mir-solr/ /opt/solr/server/solr/
USER root
ENV INIT_SOLR_HOME "yes"
ENV SOLR_HOME "/var/solr-data"/
CMD ["solr-foreground", "-force"]
