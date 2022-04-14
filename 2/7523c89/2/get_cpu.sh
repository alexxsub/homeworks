#!/bin/bash

STAT=$(cat /proc/stat | grep "cpu " | tr -d cpu)
STAT=($STAT)
sleep 1
TS=$(date +%s%N)
STAT1=$(cat /proc/stat | grep "cpu " | tr -d cpu)
STAT1=($STAT1)

STATD=( )
for ((i = 0; i < ${#STAT[*]}; i++))
    {
        ST=$(echo "${STAT1[i]}-${STAT[i]}"|bc)
        STATD+=($ST)
    }

for i in "${STATD[@]}"
do
    let "TOTAL += $i"
done

LOAD=$(printf '%.2f\n' "$(echo "scale=2; ($TOTAL-${STATD[3]})*100/$TOTAL"| bc)")

echo cpu_used,command=SH cpu_percent=$LOAD $TS