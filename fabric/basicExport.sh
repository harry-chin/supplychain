export GREEN='\033[0;32m'
export RED='\033[0;31m'
export PURPLE='\033[0;35m'
export CYAN='\033[0;36m'
export NC='\033[0m' #no color

export FONTCOLOR=${CYAN}

export FABRIC_CFG_PATH=$PWD
export CHANNEL_NAME=mainchannel 
export PROJECT=itrazo

echo "$FONTCOLOR* FABRIC_CFG_PATH = $PWD $NC"
echo "$FONTCOLOR* CHANNEL_NAME = $CHANNEL_NAME $NC"
echo "$FONTCOLOR* PROJECT = $PROJECT $NC"

ORG=("supplier" "manufacturer" "logistics" "distributor" "retailer")
ORG_MSP=("SupplierMSP" "ManufacturerMSP" "LogisticsMSP" "DistributorMSP" "RetailerMSP")