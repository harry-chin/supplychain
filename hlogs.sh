#!/bin/sh

source ./fabric/basicExport.sh
mkdir -p logs
for ORGNAME in "${ORG[@]}";
do
    docker logs peer0.$ORGNAME.${PROJECT}.com > ./logs/$ORGNAME-peer.log 2>&1
    docker logs couchdb.$ORGNAME.${PROJECT}.com > ./logs/$ORGNAME-couchdb.log 2>&1
    docker logs ca.$ORGNAME.${PROJECT}.com > ./logs/$ORGNAME-ca.log 2>&1
done
docker logs orderer.${PROJECT}.com > ./logs/ordere.log 2>&1
docker logs cli > ./logs/ordere.log 2>&1
