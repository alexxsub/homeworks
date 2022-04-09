#!/bin/sh

cpuload=$(cat /proc/stat | grep 'cpu[^0-9]' | awk '{print 100-($5*100)/($2+$3+$4+$5+$6+$7+$8+$9+$10)}')
tags=$(echo $* | sed 's/\s/,/g')

if [ -z "$tags" ]; then
    echo "cpuinfo cpuloadpercentage=$cpuload $(date +%s%N)"
else
    echo "cpuinfo,$tags cpuloadpercentage=$cpuload $(date +%s%N)"
fi