#!/bin/bash

#getting utilization memory
memory_util=$(free | sed -n '2p' | awk '{printf("%.1f%\n"), 100*(1-$7/$2)}')

# getting the timestamp
timestamp=$( echo "$(date +"%s.%N") * 1000000/1" | bc)

echo "memory,host=$HOSTNAME busy_percent=$memory_util $timestamp"
