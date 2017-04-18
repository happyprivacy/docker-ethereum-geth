#!/usr/bin/env bash

#Generate a password
if [ ! -f ~/.accountpassword ]; then
    echo `date +%s | sha256sum | base64 | head -c 32` > ~/.accountpassword
    cat ~/.accountpassword
fi

#Generate a new account
if [ ! -f ~/.primaryaccount ]; then
    geth --datadir . --dev --password ~/.accountpassword account new > ~/.primaryaccount
    cat ~/.primaryaccount

    coinbase=$(geth  --datadir . --dev --rpc --rpcaddr 0.0.0.0 --exec eth.coinbase console)
    echo $coinbase > ~/.coinbase
    cat ~/.coinbase

    echo "{\"nonce\":\"0x000000000000002a\",\"timestamp\":\"0x0\",\"parentHash\":\"0x0000000000000000000000000000000000000000000000000000000000000000\",\"extraData\":\"0x0\",\"gasLimit\":\"0x800000000000\",\"difficulty\":\"0x400\",\"mixhash\":\"0x0000000000000000000000000000000000000000000000000000000000000000\",\"coinbase\":\"0x0000000000000000000000000000000000000001\",\"alloc\":{$coinbase:{\"balance\":\"1606938044258990275541962092341162602522202993782792835301376\"}}}" > ~/.genesis.json
    cat ~/.genesis.json

    geth  --datadir . --dev init ~/.genesis.json

fi

