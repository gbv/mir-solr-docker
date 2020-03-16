#!/bin/bash
echo "Check if cores exist!";
DIR=${1:-/var/solr}
if [[ ! -d "$DIR/data/mir-main"  ||  ! -d "$DIR/data/mir-classification" ]]; then
  echo "Creating Solr-Cores!"
  solr start
  if [ ! -d "$DIR/data/mir-main" ]; then
    solr create -c mir-main -n mycore_main -force -p 8983
  fi
  if [ ! -d "$DIR/data/mir-classification" ]; then
      solr create -c mir-classification -n mycore_classification -force -p 8983
  fi
  solr stop
fi
