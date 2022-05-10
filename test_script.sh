#!/bin/bash

PERIOD=15
# fill the server name with elb_dns_name from terraform outputs
SERVER="web-lb-300388152.ap-southeast-2.elb.amazonaws.com"
PORT=80

while [ true ];do
  curl http://$SERVER:$PORT -fs -m 3 -o /dev/null
  value="$?"
  echo http_check_status {server=\"$SERVER\", port=\"$PORT\"} $value > /tmp/metrics
  sleep $PERIOD
done
