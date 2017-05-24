#!/bin/bash

docker run \
  -d \
  --net host\
  --name redis \
  redis \
  redis-server
