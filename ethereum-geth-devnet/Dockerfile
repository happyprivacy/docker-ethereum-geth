FROM happyprivacy/ethereum-geth
MAINTAINER HappyPrivacy

ADD configure.sh /
RUN chmod +x configure.sh
RUN ./configure.sh

ENTRYPOINT ["geth", "--datadir", ".", "--nodiscover", "--maxpeers", "0", "--identity", ""HappyPrivacy"", "--rpc", "--rpcaddr", ""0.0.0.0"", "--rpccorsdomain", ""*"", "--rpcapi", ""db,eth,net,web3,personal"", "--dev", "--password", "~/.accountpassword", "--mine", "--minerthreads", "1" ]


