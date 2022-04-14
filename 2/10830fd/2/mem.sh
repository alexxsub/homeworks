#!/bin/bash
#memav=$(cat /proc/meminfo | grep MemAvailable |awk '{print $2 $3}')
#memfree=$(free -h | grep Mem |awk '{print $3 }')
#tag_host=$(hostname |awk '{print $1}')

tag_host=$(hostname)
timestamp=$(date +%s)
mem=$(free | grep Mem | tr -s [:space:])
IFS=' ' read -r -a mass <<< "$mem"
mem_total=${mass[1]}
mem_used=${mass[2]}
mem_free=${mass[3]}
mem_avail=${mass[6]}

mem_proc=$((1000*mass[2]/mass[1]))
mempr=$((mem_proc/10))"."$((mem_proc%10))

echo "$mempr"

#echo "Memory, host=$tag_host mem_total=$mem_total,mem_used=$mem_used,mem_free=$mem_free,mem_avil=$mem_avail $timestamp" 




