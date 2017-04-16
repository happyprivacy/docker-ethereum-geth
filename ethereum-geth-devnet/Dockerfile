FROM happyprivacy/ethereum-geth
MAINTAINER HappyPrivacy

WORKDIR /node

ADD config /node/config

RUN geth --datadir . --password config/password.txt account new
RUN geth account list
