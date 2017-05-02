#!/bin/bash

osqueryd --verbose --tls-hostname=$1 --flagfile=./osquery.flags
