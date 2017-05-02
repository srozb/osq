#!/bin/bash

CERT_PATH="etc/tls"

sudo openssl req -x509 \
  -nodes \
  -days 730 \
  -newkey rsa:2048 \
  -keyout $CERT_PATH/haproxy.key \
  -out $CERT_PATH/haproxy.crt

sudo cat $CERT_PATH/haproxy.crt $CERT_PATH/haproxy.key \
  |tee $CERT_PATH/haproxy.pem
