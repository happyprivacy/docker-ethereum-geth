#!/usr/bin/env bash

coinbase=$(geth  --datadir . --dev --rpc --rpcaddr 0.0.0.0 --exec eth.coinbase console)
echo "Coinbase: $coinbase"
sed -i s/\"ADDRESS\"/$coinbase/g config/genesis.json
echo "Coinbase written in genesis.json file."