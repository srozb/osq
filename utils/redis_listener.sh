#!/bin/bash

docker exec -it redis redis-cli -n 0 subscribe 'osquery_log'
