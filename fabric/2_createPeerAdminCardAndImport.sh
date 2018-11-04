#!/bin/sh

source ./basicExport.sh
source ./removeAllCards.sh

echo "$FONTCOLOR# Loop Start for creating and importing PeerAdmin cards$NC"

for ORGNAME in "${ORG[@]}";
do
echo "${FONTCOLOR}# 1/3 Finding ${ORGNAME} key in keystore${NC}"
export KEYSTORE=$(ls ./crypto-config/peerOrganizations/${ORGNAME}.itrazo.com/users/Admin@${ORGNAME}.itrazo.com/msp/keystore/*sk | xargs -n 1 basename)
echo "${FONTCOLOR}# 2/3 ${ORGNAME}-keystore: '$KEYSTORE'${NC}"

echo "${FONTCOLOR}# 3/3 Create and Import ${ORGNAME} PeerAdmin cards${NC}"
composer card create\
 -p connection-profiles/${ORGNAME}.json\
 -u PeerAdmin\
 -r PeerAdmin -r ChannelAdmin\
 -f ./id-cards/PeerAdmin@itrazo-${ORGNAME}.card\
 -k ./crypto-config/peerOrganizations/${ORGNAME}.itrazo.com/users/Admin@${ORGNAME}.itrazo.com/msp/keystore/$KEYSTORE\
 -c ./crypto-config/peerOrganizations/${ORGNAME}.itrazo.com/users/Admin@${ORGNAME}.itrazo.com/msp/signcerts/Admin@${ORGNAME}.itrazo.com-cert.pem

composer card import -f ./id-cards/PeerAdmin@itrazo-${ORGNAME}.card
done
echo "$FONTCOLOR# Loop Finished for creating and importing PeerAdmin cards$NC"

echo "${RED}### Please confirm that CA keyfile matches in docker-compose.yaml! ###"
for ORGNAME in "${ORG[@]}";
do
export KEYSTORE=$(ls ./crypto-config/peerOrganizations/${ORGNAME}.itrazo.com/ca/*sk | xargs -n 1 basename)
echo "${FONTCOLOR}# ${ORGNAME}-keystore: '$KEYSTORE'${NC}"
done