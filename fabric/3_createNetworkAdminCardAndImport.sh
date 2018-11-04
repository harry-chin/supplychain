#!/bin/sh

source ./basicExport.sh

echo "${FONTCOLOR}# 1/3 Stop and Start fabric network${NC}"
./stop.sh
./start.sh

for ORGNAME in "${ORG[@]}";
do
echo "${FONTCOLOR}# Create and import ${ORGNAME} network admin card${NC}"
composer identity request -c PeerAdmin@itrazo-${ORGNAME} -u admin -s adminpw -d ./id-cards/${ORGNAME}-network-admin
composer card create -p connection-profiles/${ORGNAME}.json -u ${ORGNAME}-network-admin -n itrazo -c id-cards/${ORGNAME}-network-admin/admin-pub.pem -k id-cards/${ORGNAME}-network-admin/admin-priv.pem -f id-cards/${ORGNAME}-network-admin.card
composer card import -f id-cards/${ORGNAME}-network-admin.card
done
echo "$FONTCOLOR# Loop Finished for creating and importing Network Admin cards$NC"
