# Docker for Reposis
This dockerfile creates a solr server with the mir-config sets installed. 

## Environment Variables
SOLR_HOME = /opt/mir-solr-data/

## Mount point 
-> see SOLR_HOME

##Example Usage:
```
sudo docker run -it -p 8983:8983 -v /home/paschty/solr-docker2:/opt/mir-solr-data/ -e SOLR_HOME=/opt/mir-solr-data/ vzgreposis/mir-solr:lts
```

## build and deploy
```
sudo docker build --pull --no-cache . -t vzgreposis/mir-solr:lts
sudo docker push  vzgreposis/mir-solr:lts
```
