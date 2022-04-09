#!/usr/bin/env bash

MEASUREMENT_NAME="CPU"
HOSTNAME="$(cat /proc/sys/kernel/hostname)"

CPU_USAGE="$(vmstat 1 2 | tail -1)"
CPU_USER="$(echo ${CPU_USAGE} | awk '{print $13}')"
CPU_SYSTEM="$(echo ${CPU_USAGE} | awk '{print $14}')"
CPU_IDLE="$(echo ${CPU_USAGE} | awk '{print $15}')"
CPU_IOWAIT="$(echo ${CPU_USAGE} | awk '{print $16}')"
CPU_ST="$(echo ${CPU_USAGE} | awk '{print $17}')"

TAGS="hostname=$HOSTNAME"
METRICS="user=$CPU_USER,system=$CPU_SYSTEM,idle=$CPU_IDLE,iowait=$CPU_IOWAIT,st=$CPU_ST"
TIMESTAMP="$(date +%s)"
OUTPUT="$MEASUREMENT_NAME,$TAGS $METRICS $TIMESTAMP"

echo "$OUTPUT"
