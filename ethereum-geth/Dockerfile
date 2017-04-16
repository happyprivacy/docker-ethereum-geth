FROM ubuntu:xenial
MAINTAINER HappyPrivacy

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get install software-properties-common && \
    add-apt-repository -y ppa:ethereum/ethereum && \
    apt-get update && \
    apt-get install ethereum solc && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

EXPOSE 8545
EXPOSE 30303



