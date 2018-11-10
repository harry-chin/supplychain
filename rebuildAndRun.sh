#!/bin/sh

cd fabric
source basicExport.sh
source generateCryptoData.sh
source 1_generateGenesisBlockAndChannelData.sh
source 2_createPeerAdminCardAndImport.sh
source 3_createNetworkAdminCardAndImport.sh
cd ..
./runProject.sh