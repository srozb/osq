#!/bin/bash

docker exec -it redis redis-cli -n 0 lrange 'osquery_log' 0 -1
