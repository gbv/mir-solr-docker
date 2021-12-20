# Bind paths /var/solr/data
FROM alpine/git as git
WORKDIR /opt/
RUN git --version && \
    git clone --recursive https://github.com/MyCoRe-Org/mycore_solr_configset_main.git &&\
    git clone --recursive https://github.com/MyCoRe-Org/mycore_solr_configset_classification.git
FROM solr:8.11
COPY --from=git --chown=solr:solr /opt/mycore_solr_configset_main/ /opt/solr/server/solr/configsets/mycore_solr_configset_main
COPY --from=git --chown=solr:solr /opt/mycore_solr_configset_classification/ /opt/solr/server/solr/configsets/mycore_solr_configset_classification
COPY --chown=solr:solr docker-entrypoint.sh ./
RUN chmod +x docker-entrypoint.sh
CMD ["bash", "docker-entrypoint.sh"]

