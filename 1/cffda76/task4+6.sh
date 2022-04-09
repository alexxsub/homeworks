#!/bin/bash
h=${hostname -a}

cpu_busy="$[100-$(vmstat 1 2|tail -1|awk '{print $15}')]"
la1=$(cat /proc/loadavg |awk '{print $1}')
la5=$(cat /proc/loadavg |awk '{print $2}')
la15=$(cat /proc/loadavg |awk '{print $3}')
timestamp=$(date +%s%N)


printf "cpu,host=${h},contur=home busy_percent=${cpu_busy},la1=${la1},la5=${la5},la15=${la15} ${timestamp}\n"


mem_busy=$(free -t | awk 'FNR == 2 {printf("%.0f"), $3/$2*100}')
mem_total=$(free -t | awk 'FNR == 2 {print $2}')
mem_free=$(free -t | awk 'FNR == 2 {print $4}')
mem_used=$(free -t | awk 'FNR == 2 {print $3}')
timestamp=$(date +%s%N)

printf "memory,host=${h},contur=home busy_percent=${mem_busy},total=${mem_total},free=${mem_free},used=${mem_used} ${timestamp}\n"