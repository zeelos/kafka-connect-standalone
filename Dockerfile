FROM zeelos/cp-kafka-connect-base:4.1.1-arm32v7
MAINTAINER zeelos.io - https://zeelos.io

COPY include/etc/confluent/docker /etc/confluent/docker
