#!/bin/bash

TS=$(date +%s%N)
MEM=$(cat /proc/meminfo)

TOTAL=$( echo $MEM | cut -d ' ' -f 2 )
FREE=$( echo $MEM | cut -d ' ' -f 5 )
USED=$(printf '%.2f\n' "$(echo "scale=2; ($TOTAL-$FREE)*100/$TOTAL"| bc)")

echo memory_used,command=SH memory_percent=$USED $TS