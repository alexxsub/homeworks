#! /bin/bash

total=`awk '/MemTotal/ {printf $2}' /proc/meminfo`
free=`awk '/MemFree/ {printf $2}' /proc/meminfo`
buffers=`awk '/Buffers/ {printf $2}' /proc/meminfo`
cache=`awk '/^Cached/ {printf $2}' /proc/meminfo`

memory_used_gb=$((($total - $free - $buffers - $cache)/1024/1024))

echo "memory,host=`hostname` memory_used_gb=$memory_used_gb $(date +%s)"