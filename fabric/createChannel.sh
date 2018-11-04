echo "Creating channel"
CORE_PEER_ADDRESS=peer0.supplier.itrazo.com:7051
CORE_PEER_LOCALMSPID=SupplierMSP
CORE_PEER_MSPCONFIGPATH=/opt/gopath/crypto-config/peerOrganizations/supplier.itrazo.com/users/Admin@supplier.itrazo.com/msp

peer channel create -o orderer.itrazo.com:7050 -c mainchannel -f ./channel/mainchannel.tx

sleep 10

echo "Joining peers"
peer channel join -b mainchannel.block

# CORE_PEER_ADDRESS=peer1.supplier.itrazo.com:7051
# peer channel join -b mainchannel.block

CORE_PEER_LOCALMSPID=ManufacturerMSP
CORE_PEER_MSPCONFIGPATH=/opt/gopath/crypto-config/peerOrganizations/manufacturer.itrazo.com/users/Admin@manufacturer.itrazo.com/msp
CORE_PEER_ADDRESS=peer0.manufacturer.itrazo.com:7051
peer channel join -b mainchannel.block

CORE_PEER_LOCALMSPID=LogisticsMSP
CORE_PEER_MSPCONFIGPATH=/opt/gopath/crypto-config/peerOrganizations/logistics.itrazo.com/users/Admin@logistics.itrazo.com/msp
CORE_PEER_ADDRESS=peer0.logistics.itrazo.com:7051
peer channel join -b mainchannel.block

CORE_PEER_LOCALMSPID=DistributorMSP
CORE_PEER_MSPCONFIGPATH=/opt/gopath/crypto-config/peerOrganizations/distributor.itrazo.com/users/Admin@distributor.itrazo.com/msp
CORE_PEER_ADDRESS=peer0.distributor.itrazo.com:7051
peer channel join -b mainchannel.block

CORE_PEER_LOCALMSPID=RetailerMSP
CORE_PEER_MSPCONFIGPATH=/opt/gopath/crypto-config/peerOrganizations/retailer.itrazo.com/users/Admin@retailer.itrazo.com/msp
CORE_PEER_ADDRESS=peer0.retailer.itrazo.com:7051
peer channel join -b mainchannel.block

echo "Updating anchor peers"
CORE_PEER_LOCALMSPID=SupplierMSP
CORE_PEER_MSPCONFIGPATH=/opt/gopath/crypto-config/peerOrganizations/supplier.itrazo.com/users/Admin@supplier.itrazo.com/msp
CORE_PEER_ADDRESS=peer0.supplier.itrazo.com:7051
peer channel update -o orderer.itrazo.com:7050 -c mainchannel -f ./channel/SupplierMSPanchors.tx

CORE_PEER_LOCALMSPID=ManufacturerMSP
CORE_PEER_MSPCONFIGPATH=/opt/gopath/crypto-config/peerOrganizations/manufacturer.itrazo.com/users/Admin@manufacturer.itrazo.com/msp
CORE_PEER_ADDRESS=peer0.manufacturer.itrazo.com:7051
peer channel update -o orderer.itrazo.com:7050 -c mainchannel -f ./channel/ManufacturerMSPanchors.tx

CORE_PEER_LOCALMSPID=LogisticsMSP
CORE_PEER_MSPCONFIGPATH=/opt/gopath/crypto-config/peerOrganizations/logistics.itrazo.com/users/Admin@logistics.itrazo.com/msp
CORE_PEER_ADDRESS=peer0.logistics.itrazo.com:7051
peer channel update -o orderer.itrazo.com:7050 -c mainchannel -f ./channel/LogisticsMSPanchors.tx

CORE_PEER_LOCALMSPID=DistributorMSP
CORE_PEER_MSPCONFIGPATH=/opt/gopath/crypto-config/peerOrganizations/distributor.itrazo.com/users/Admin@distributor.itrazo.com/msp
CORE_PEER_ADDRESS=peer0.distributor.itrazo.com:7051
peer channel update -o orderer.itrazo.com:7050 -c mainchannel -f ./channel/DistributorMSPanchors.tx

CORE_PEER_LOCALMSPID=RetailerMSP
CORE_PEER_MSPCONFIGPATH=/opt/gopath/crypto-config/peerOrganizations/retailer.itrazo.com/users/Admin@retailer.itrazo.com/msp
CORE_PEER_ADDRESS=peer0.retailer.itrazo.com:7051
peer channel update -o orderer.itrazo.com:7050 -c mainchannel -f ./channel/RetailerMSPanchors.tx

echo "############ createChannel.sh DONE ##############"