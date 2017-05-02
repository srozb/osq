#!/bin/bash

docker run \
  -d \
  --name haproxy \
  --net host \
  -v `pwd`/etc:/usr/local/etc/haproxy:ro \
  haproxy:alpine
