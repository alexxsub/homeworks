#!/bin/bash

TS=$(date +%s%N)
MEM=$(cat /proc/meminfo)

TOTAL=$( echo $MEM | cut -d ' ' -f 2 )
FREE=$( echo $MEM | cut -d ' ' -f 5 )
USED=$( echo "($TOTAL-$FREE)*100/$TOTAL" | bc )

echo memory_used,task=6 memory_total=$TOTAL,%memory_used=$USED,memory_free=$FREE $TS
