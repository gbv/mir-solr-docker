# Bind paths /var/solr/data
FROM alpine/git as git
RUN mkdir /opt/mir-solr
WORKDIR /opt/
RUN git --version && \
    git clone --recursive https://github.com/MyCoRe-Org/mir-solr.git
FROM solr:7
EXPOSE 8983
USER solr
COPY --from=git --chown=solr:solr /opt/mir-solr/ /opt/solr/server/solr/
WORKDIR /opt/solr
USER $SOLR_USER
ENV INIT_SOLR_HOME "yes"
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["solr-foreground"]