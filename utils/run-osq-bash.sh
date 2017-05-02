#!/bin/bash

docker run \
  --rm \
  -it \
  --name osqueryd \
  --net host \
  -v `pwd`/scripts:/scripts \
  kolide/osquery \
  bash
