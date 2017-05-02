#!/bin/bash

docker run \
  -d \
  --name osqueryd \
  --net host \
  kolide:osquery osqueryd 
