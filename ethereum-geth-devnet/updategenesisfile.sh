#!/usr/bin/env bash
coinbase=$(geth  --datadir . --dev --rpc --rpcaddr 0.0.0.0 --exec eth.coinbase console)
sed -i s/\"ADDRESS\"/$coinbase/g /node/config/genesis.json
