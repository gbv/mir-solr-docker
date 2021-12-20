# Docker for Reposis
This dockerfile creates a solr server with the mir-config sets installed. 

##Example Usage:
```
docker run -v solr-data6:/var/solr/data -it -p 8983:8983 vzgreposis/mir-solr
```

## build and deploy
```
sudo docker build --pull --no-cache . -t vzgreposis/mir-solr
sudo docker push  vzgreposis/mir-solr
```
