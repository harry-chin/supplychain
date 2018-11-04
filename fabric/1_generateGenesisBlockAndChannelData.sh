#!/bin/sh

source ./basicExport.sh

echo "${FONTCOLOR}# 1/7 Generate Genesis block${NC}"
configtxgen -profile MainOrdererGenesis -outputBlock ./channel/main-genesis.block

echo "${FONTCOLOR}# 2/7 CreateChannel${NC}"
configtxgen -profile MainChannel -outputCreateChannelTx ./channel/mainchannel.tx -channelID $CHANNEL_NAME

echo "${FONTCOLOR}# 3/7 UpdateAnchorPeer - Supplier${NC}"
configtxgen -profile MainChannel -outputAnchorPeersUpdate ./channel/SupplierMSPanchors.tx -channelID $CHANNEL_NAME -asOrg Supplier

echo "${FONTCOLOR}# 4/7 UpdateAnchorPeer - Manufacturer${NC}"
configtxgen -profile MainChannel -outputAnchorPeersUpdate ./channel/ManufacturerMSPanchors.tx -channelID $CHANNEL_NAME -asOrg Manufacturer

echo "${FONTCOLOR}# 5/7 UpdateAnchorPeer - Logistics${NC}"
configtxgen -profile MainChannel -outputAnchorPeersUpdate ./channel/LogisticsMSPanchors.tx -channelID $CHANNEL_NAME -asOrg Logistics

echo "${FONTCOLOR}# 6/7 UpdateAnchorPeer - Distributor${NC}"
configtxgen -profile MainChannel -outputAnchorPeersUpdate ./channel/DistributorMSPanchors.tx -channelID $CHANNEL_NAME -asOrg Distributor

echo "${FONTCOLOR}# 7/7 UpdateAnchorPeer - Retailer${NC}"
configtxgen -profile MainChannel -outputAnchorPeersUpdate ./channel/RetailerMSPanchors.tx -channelID $CHANNEL_NAME -asOrg Retailer