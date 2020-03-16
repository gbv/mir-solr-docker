# Docker for Reposis

This dockerfile creates a solr server with the mir-config sets installed. It also creates the cores if they dont exist.

Mount point
- /var/solr/ - contains all the solr-related data

WARNING: the mountpoint on the host needs to have the user ids 8983
```
sudo chown -R 8983:8983 /home/paschty/solr-data
```

## build and deploy
```
sudo docker build --pull --no-cache . -t vzgreposis/mir-solr:lts
sudo docker push  vzgreposis/mir-solr:lts
```
