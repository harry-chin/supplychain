source ./basicExport.sh

echo ${FONTCOLOR}
echo "# 1/2 Remove id-cards directory for deleting all cards and create empty directory for preparation"
echo ${NC}
rm -rf ./id-cards
mkdir ./id-cards
echo ${FONTCOLOR}
echo "# 2/2 Deleting old ID cards, these commands may fail"
echo ${NC}
composer card delete -c PeerAdmin@itrazo-supplier
composer card delete -c PeerAdmin@itrazo-manufacturer
composer card delete -c PeerAdmin@itrazo-logistics
composer card delete -c PeerAdmin@itrazo-distributor
composer card delete -c PeerAdmin@itrazo-retailer
composer card delete -c supplier-network-admin@itrazo
composer card delete -c manufacturer-network-admin@itrazo
composer card delete -c logistics-network-admin@itrazo
composer card delete -c distributor-network-admin@itrazo
composer card delete -c retailer-network-admin@itrazo