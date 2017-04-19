FROM happyprivacy/ethereum-geth
MAINTAINER HappyPrivacy

RUN mkdir /node

RUN mkdir /node/config

WORKDIR /node

ADD genesis.json /node/config

ADD password.txt /node/config

RUN geth --datadir . --password config/password.txt account new > /node/config/accountprimary.txt

RUN cat /node/config/accountprimary.txt

ADD updategenesisfile.sh /node/config
RUN chmod +x /node/config/updategenesisfile.sh
RUN /node/config/updategenesisfile.sh

RUN cat /node/config/genesis.json

RUN geth  --datadir . init config/genesis.json

ENTRYPOINT ["geth", "--datadir", ".", "--nodiscover", "--maxpeers", "0", "--identity", "HappyPrivacy", "--rpc", "--rpcaddr", "0.0.0.0", "--rpccorsdomain", "*", "--rpcapi", "db,eth,net,web3,personal", "--password", "config/password.txt", "--mine", "--minerthreads", "1" ]


