#!/usr/bin/env bash
##
## return example:
##  posix_processor,devId=pve cpu_total=13.93 1648720689
##
cpu=$(grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {print usage}' | awk '{printf("%.2f \n",$1)}')
id=$(hostname)
echo "posix_processor,devId=$id cpu_total=$cpu$(date +%s)"