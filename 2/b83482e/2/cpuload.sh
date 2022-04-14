#!/bin/sh

cpuinfo1=$(cat /proc/stat | grep 'cpu[^0-9]')
sleep 1
timestamp=$(date +%s%N)
cpuinfo2=$(cat /proc/stat | grep 'cpu[^0-9]')
cpuload=$(
    echo $cpuinfo1 $cpuinfo2 | awk '{
        print 100-($16-$5)*100/($13+$14+$15+$16+$17+$18+$19+$20+$21+$22-$2-$3-$4-$5-$6-$7-$8-$9-$10-$11)
        }'
)
tags=$(echo $* | sed 's/\s/,/g')


echo "cpuinfo cpuload=$cpuload $timestamp"