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

cd $PROJECT_FABRIC
./stop.sh
./start.sh

docker exec cli /bin/sh "./createChannel.sh"

for ORGNAME in "${ORG[@]}";
do
echo "$FONTCOLOR# installing network $ORGNAME $NC"
composer network install -c PeerAdmin@$PROJECT-${ORGNAME} --archiveFile $PROJECT_COMPOSER/bin/$PROJECT.bna
done

composer network start\
 -c PeerAdmin@$PROJECT-supplier\
 -n $PROJECT\
 -V $VERSION\
 -o endorsementPolicyFile=$PROJECT_COMPOSER/endorsement-policy.json\
 -A supplier-network-admin\
 -C $PROJECT_FABRIC/id-cards/supplier-network-admin/admin-pub.pem\
 -A manufacturer-network-admin\
 -C $PROJECT_FABRIC/id-cards/manufacturer-network-admin/admin-pub.pem\
 -A logistics-network-admin\
 -C $PROJECT_FABRIC/id-cards/logistics-network-admin/admin-pub.pem\
 -A distributor-network-admin\
 -C $PROJECT_FABRIC/id-cards/distributor-network-admin/admin-pub.pem\
 -A retailer-network-admin\
 -C $PROJECT_FABRIC/id-cards/retailer-network-admin/admin-pub.pem

echo "#Running composer-rest-server"
composer-rest-server -c supplier-network-admin@$PROJECT -n never -a false -w true -t false &
 
