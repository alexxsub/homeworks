#! /bin/bash

hostname=$(hostname | tr a-z A-Z)
timestamp=$(date +%s%N)
cpu_percent=$(cat <(grep 'cpu ' /proc/stat) <(sleep 1 && grep 'cpu ' /proc/stat) | awk -v RS="" '{printf "%.2f\n", ($13-$2+$15-$4)*100/($13-$2+$15-$4+$16-$5)}')

echo "cpu_percent,host=$hostname,script=cpu_sh cpu_percent"=$cpu_percent $timestamp