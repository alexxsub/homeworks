#!/bin/bash
#tag_host=$(hostname |awk '{print $1}')
tag_host=$(hostname)
timestamp=$(date +%s)
cpu=$(uptime | tr -s [:space:])
cpu=${cpu##*average:}
IFS=', ' read -r -a mass_cpu <<< "$cpu"

echo "CPU, host=$tag_host cpu_5s=${mass_cpu[0]},cpu_1m=${mass_cpu[1]},cpu_5m=${mass_cpu[2]} $timestamp"
