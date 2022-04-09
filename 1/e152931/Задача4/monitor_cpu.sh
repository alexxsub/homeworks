#!/bin/bash

cat /proc/stat | head -1 |  awk '{ u=$2;n=$3;s=$4;i=$5;print u,n,s,i }' | while read u n s i
do
#getting utilization cpu
cpu_util=$( echo "scale=1;100*($u+$n+$s)/($u+$n+$s+$i)" | bc)

# getting the timestamp
timestamp=$( echo "$(date +"%s.%N") * 1000000/1" | bc)

echo "CPU,host=$HOSTNAME busy_percent=$cpu_util $timestamp"
done 
