#!/bin/bash

ufw_status=$(sudo ufw status | grep "Status: active")

if [ -n "$ufw_status" ]; then
  echo "ufw_status 1" > /var/lib/node_exporter/textfile_collector/ufw.prom
else
  echo "ufw_status 0" > /var/lib/node_exporter/textfile_collector/ufw.prom
fi
