#!/bin/bash
#
# This script will wait until Admin Server is available.
# There is no timeout!
#
echo "Waiting for WebLogic Node Manager on localhost:5556 to become available..."
while :
do
  (echo > /dev/tcp/localhost/5556) >/dev/null 2>&1
  available=$?
  if [[ $available -eq 0 ]]; then
    echo "WebLogic Node Manager is now available. Proceeding..."
    break
  else
    echo "Waiting for WebLogic Node Manager to become available..."
  fi
  sleep 5
done
