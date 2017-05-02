#!/bin/bash

osqueryd  --tls-hostname=$1 --flagfile=./osquery.flags
