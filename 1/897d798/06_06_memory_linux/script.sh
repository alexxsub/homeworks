#!/usr/bin/env bash

MEASUREMENT_NAME="MEM"
HOSTNAME="$(cat /proc/sys/kernel/hostname)"

MEM_USAGE=`free -m | grep Mem`
MEM_TOTAL=`echo "$MEM_USAGE" | awk '{print $2}'`
MEM_USED=`echo "$MEM_USAGE" | awk '{print $3}'`
MEM_FREE=`echo "$MEM_USAGE" | awk '{print $4}'`
MEM_BUFFER=`echo "$MEM_USAGE" | awk '{print $6}'`
MEM_CACHE=`echo "$MEM_USAGE" | awk '{print $7}'`
MEM_USED_PRCT=`echo $((($MEM_USED*100)/$MEM_TOTAL)) | cut -d. -f1`

TAGS="hostname=$HOSTNAME"
METRICS="total=$MEM_TOTAL,used=$MEM_USED,free=$MEM_FREE,buffer=$MEM_BUFFER,cache=$MEM_CACHE,user_prct=$MEM_USED_PRCT"
TIMESTAMP="$(date +%s)"
OUTPUT="$MEASUREMENT_NAME,$TAGS $METRICS $TIMESTAMP"

echo "$OUTPUT"
