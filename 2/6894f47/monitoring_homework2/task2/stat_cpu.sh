#!/bin/bash
mpstat 1 1 | grep 'Average:' | \
  awk -v timestamp=$(date +%s%N) \
  '{print "cpu,type=cpu cpuload="100-$12" "timestamp}'
