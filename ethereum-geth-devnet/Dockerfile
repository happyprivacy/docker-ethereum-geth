FROM happyprivacy/ethereum-geth
MAINTAINER HappyPrivacy

WORKDIR /root

ADD config /root/config

# Generate new account
RUN geth --datadir . --password config/password.txt account new
RUN geth account list

ADD buildgenesis.sh /root
RUN chmod +x buildgenesis.sh
RUN ./buildgenesis.sh
RUN geth  --datadir . --dev init config/genesis.json

EXPOSE 8545
EXPOSE 30303

ENTRYPOINT ["/usr/bin/geth",  "--datadir", ".", "--password", "root/password.txt", "--unlock", "0", "--dev", "--rpc", "--rpcaddr", "0.0.0.0"]
