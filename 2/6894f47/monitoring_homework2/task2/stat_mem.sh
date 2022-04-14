#!/bin/bash

MEM_STAT=$(free)
TIMESTAMP=$(date +%s%N)

MemTotal=$(echo "$MEM_STAT" | grep 'Mem:' | awk '{print $2}')
MemUsed=$(echo "$MEM_STAT" | grep 'Mem:' | awk '{print $3}')
MemUsedPercent=$(printf %.1f "$((10**3 * $MemUsed/$MemTotal * 100))e-3")

echo "memory,type=memory memused=${MemUsedPercent} ${TIMESTAMP}"
