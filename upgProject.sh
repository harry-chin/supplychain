#!/bin/sh

source ./fabric/basicExport.sh

PROJECT_ROOT=$(pwd)
PROJECT_COMPOSER=$PROJECT_ROOT/composer
PROJECT_FABRIC=$PROJECT_ROOT/fabric

source buildBNA.sh

cd $PROJECT_COMPOSER
VERSION=$(cat package.json \
  | grep version \
  | head -1 \
  | awk -F: '{ print $2 }' \
  | sed 's/[",]//g' \
  | tr -d '[[:space:]]')
echo "==============================="
echo "Version: " $VERSION
echo "==============================="


for ORGNAME in "${ORG[@]}";
do
echo "$FONTCOLOR# installing network $ORGNAME $NC"
composer network install -c PeerAdmin@$PROJECT-${ORGNAME} --archiveFile $PROJECT_COMPOSER/bin/$PROJECT.bna
done

composer network upgrade\
 -c PeerAdmin@$PROJECT-supplier\
 -n $PROJECT\
 -V $VERSION

#run docker logs -f dev-peer0.org1.example.com-$1-$VERSION 2>&1 | grep -a CustomLog
echo "==============================="
echo "Kill composer-rest-server "
echo "==============================="
kill -9 $(lsof -t -i:3000)

echo "==============================="
echo "Rerun composer-rest-server "
echo "==============================="
echo "#Running composer-rest-server"
composer-rest-server -c supplier-network-admin@$PROJECT -n never -a false -w true -t false &
