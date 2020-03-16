# Docker for Reposis

This dockerfile creates a solr server with the mir-config sets installed. It also creates the cores if they dont exist.

Mount point
- /var/solr/ - contains all the solr-related data

## build and deploy
```
sudo docker build --pull --no-cache . -t vzgreposis/mir-solr:lts
sudo docker push  vzgreposis/mir-solr:lts
```
