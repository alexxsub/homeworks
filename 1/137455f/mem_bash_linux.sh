#!/bin/bash

cur_time=`date +%s`
cpu_util=`cat /proc/stat | grep -w cpu | awk '{print ($2+$4)*100/($2+$4+$5)}'`
mem_info=`free | grep -w Mem: | awk '{print $3}'`

echo "memory, host="`hostname -a` ",contur=prod memory_utilization="$mem_info $cur_time
