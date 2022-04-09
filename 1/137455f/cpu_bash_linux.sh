#!/bin/bash

cur_time=`date +%s`
cpu_util=`cat /proc/stat | grep -w cpu | awk '{print ($2+$4)*100/($2+$4+$5)}'`
host=`hostname -a`

echo "cpu, host="host ",contur=prod cpu_utilization="$cpu_util $cur_time
