#!/usr/bin/env bash
# This script is used to start a local hardhat node, and deploy the SC to it

set -m 
# Run the script in the background


term() {
    echo "Caught SIGTERM"
    kill -TERM "$hardat" "$node"
}

trap term SIGTERM

#echo "<---- Compile SC ---->"
#npx hardhat clean
#Clean the local hardhat node

#npx hardhat compile
# Compile the SC

#echo "<---- Launching Network ---->"
npx hardhat node &
hardat=$!

# Launch hardhat node in the background

#echo "<---- Launching nc ---->"
node netcat.js &
node=$!

#echo "<---- Foreground hardhat node ---->"
# fg %1 
# Bring the hardhat node back to the foreground

wait "$hardat" "$node"
