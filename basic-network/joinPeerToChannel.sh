docker-compose -f pc2-docker-compose-new-peer.yaml down

docker-compose -f pc2-docker-compose-new-peer.yaml up -d

# wait for Hyperledger Fabric to start
# incase of errors when running later commands, issue export FABRIC_START_TIMEOUT=<larger number>
export FABRIC_START_TIMEOUT=120
#echo ${FABRIC_START_TIMEOUT}
sleep ${FABRIC_START_TIMEOUT}

#docker exec -e "CORE_PEER_LOCALMSPID=abgMSP" -e "CORE_PEER_MSPCONFIGPATH=/etc/hyperledger/msp/users/Admin@abg.grasim.com/msp" -e "CORE_PEER_ADDRESS=peer0.abg.grasim.com:7051" peer0.abg.grasim.com peer channel join -b mychannel.block

docker exec -e "CORE_PEER_LOCALMSPID=Org1MSP" -e "CORE_PEER_MSPCONFIGPATH=/etc/hyperledger/msp/users/Admin@org1.example.com/msp" -e "CORE_PEER_ADDRESS=peer1.org1.example.com:7051" peer0.org1.example.com peer channel join -b mychannel.block


