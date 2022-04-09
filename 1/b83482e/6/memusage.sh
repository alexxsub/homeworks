#!/bin/sh

memtotal=$(grep 'MemTotal' /proc/meminfo | awk '{print $2}')
memavailable=$(grep 'MemAvailable' /proc/meminfo | awk '{print $2}')
memusage=$((100-$memavailable*100/$memtotal))

tags=$(echo $* | sed 's/\s/,/g')

if [ -z "$tags" ]; then
    echo "meminfo memusagepercentage=$memusage $(date +%s%N)"
else
    echo "meminfo,$tags memusagepercentage=$memusage $(date +%s%N)"
fi