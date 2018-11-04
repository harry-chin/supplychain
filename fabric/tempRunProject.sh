CORE_PEER_LOCALMSPID=RetailerMSP
CORE_PEER_MSPCONFIGPATH=/opt/gopath/crypto-config/peerOrganizations/retailer.itrazo.com/users/Admin@retailer.itrazo.com/msp
CORE_PEER_ADDRESS=peer0.retailer.itrazo.com:7051
peer channel join -b mainchannel.block

CORE_PEER_LOCALMSPID=RetailerMSP
CORE_PEER_MSPCONFIGPATH=/opt/gopath/crypto-config/peerOrganizations/retailer.itrazo.com/users/Admin@retailer.itrazo.com/msp
CORE_PEER_ADDRESS=peer0.retailer.itrazo.com:7051
peer channel update -o orderer.itrazo.com:7050 -c mainchannel -f ./channel/RetailerMSPanchors.tx