#!/bin/bash

mem_total=$(awk '/MemTotal/ {printf( "%d\n", $2*1024 )}' /proc/meminfo)
mem_free=$(awk '/MemFree/ {printf( "%d\n", $2*1024 )}' /proc/meminfo)
mem_usage_percent=$(awk "BEGIN { print int(($mem_total-$mem_free)/$mem_total*100); }")

echo "mem_usage,totalmem=$mem_total,freemem=$mem_free,mem_usage_percent=$mem_usage_percent "$(date +%s%N)
