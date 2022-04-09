#!/bin/bash

MEM_STAT=$(free)
TIMESTAMP=$(date +%s)

MemTotal=$(echo "$MEM_STAT" | grep 'Mem:' | awk '{print $2}')
MemUsed=$(echo "$MEM_STAT" | grep 'Mem:' | awk '{print $3}')
SwapTotal=$(echo "$MEM_STAT" | grep 'Swap:' | awk '{print $2}')
SwapTotal=$(echo "$MEM_STAT" | grep 'Swap:' | awk '{print $3}')

echo "memory,type=memory memtotalkb=${MemTotal} ${TIMESTAMP}"
echo "memory,type=memory memusedkb=${MemUsed} ${TIMESTAMP}"
echo "memory,type=swap swaptotalkb=${SwapTotal} ${TIMESTAMP}"
echo "memory,type=swap swapusedkb=${SwapTotal} ${TIMESTAMP}"
