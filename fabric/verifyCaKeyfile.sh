#!/bin/sh

source ./basicExport.sh

echo "${RED}### Please confirm that keyfile matches in docker-compose.yaml! ###"
for ORGNAME in "${ORG[@]}";
do
KEYSTORE=$(ls ./crypto-config/peerOrganizations/${ORGNAME}.itrazo.com/ca/*sk | xargs -n 1 basename)
KEYSTORE_YAML=$(cat docker-compose.yaml | grep ca.${ORGNAME}.itrazo.com-cert.pem | awk -F/ '{ print $9 }' | awk '{print $1}')

if [ $KEYSTORE == $KEYSTORE_YAML ]
then 
    FONTCOLOR=$GREEN
    echo "${CYAN}Key value is matched for ${ORGNAME}$NC"
    echo "${FONTCOLOR}# ${ORGNAME}-keystore                  : '$KEYSTORE'${NC}"
    echo "${FONTCOLOR}# ${ORGNAME}-key in docker-compose.yaml: '$KEYSTORE_YAML'${NC}"

else
    FONTCOLOR=$CYAN
    echo "${CYAN}Key value is not matched for ${ORGNAME}$NC"
    sed -i -e "s/$KEYSTORE_YAML/${KEYSTORE}/" docker-compose.yaml
    echo "$GREEN$KEYSTORE_YAML ${RED}changed to\n$CYAN$KEYSTORE in docker-compose.yaml$NC"
fi
#echo "${FONTCOLOR}# ${ORGNAME}-keystore                  : '$KEYSTORE'${NC}"
#echo "${FONTCOLOR}# ${ORGNAME}-key in docker-compose.yaml: '$KEYSTORE_YAML'${NC}"
#cat docker-compose.yaml | grep ca.${ORGNAME}.itrazo.com-cert.pem | awk -F/ '{ print $9 }' | awk '{print $1}' | sed "s/$KEYSTORE_YAML/${KEYSTORE}${ORGNAME}/" docker-compose.yaml
#sed -i -e "s/$KEYSTORE_YAML/${KEYSTORE}${ORGNAME}/" docker-compose.yaml
done
