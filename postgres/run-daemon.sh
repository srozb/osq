#!/bin/bash

docker run \
  -d \
  --name postgres \
  --net host \
  -e POSTGRES_USER=osq \
  -e POSTGRES_PASSWORD=change_this \
  postgres:alpine
