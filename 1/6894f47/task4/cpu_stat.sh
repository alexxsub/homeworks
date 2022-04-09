#!/bin/bash

CPU_COUNT=$(lscpu | awk '$1 ~ /CPU\(s\):/ {print $2}')

for c in $(seq 0 $(($CPU_COUNT-1)))
do
    mpstat -P $c | \
    awk -v num=$c -v timestamp=$(date +%s) \
    '$3 == num {print "cpu,core_num="num",type=cpu cpuload="100-$13" "timestamp}'
done
