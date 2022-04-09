#!/bin/sh
 
mem_total=$(grep MemTotal /proc/meminfo | awk '{ print $2 }')
mem_available=$(grep MemAvailable /proc/meminfo | awk '{ print $2 }')
mem_used=$((mem_total - mem_available))

mem_load=$((mem_used * 100 / mem_total))
time_stamp=$(date +%s%N)

echo -n "mem_busy host=$(hostname) percent=$mem_load $time_stamp"
