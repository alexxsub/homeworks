#! /bin/bash

MEASUREMENT="MEMORY_bash"
TAG_KEYS="host=\"Ubuntu1\""
MEM_TOTAL=$(grep 'MemTotal' /proc/meminfo | awk '{print($2)}')
MEM_FREE=$(grep 'MemFree' /proc/meminfo | awk '{print($2)}')
MEM_AVAIL=$(grep 'MemAvailable' /proc/meminfo | awk '{print($2)}')
PERCENT=10
FIELD_KEYS="Total=${MEM_TOTAL},Free=${MEM_FREE},Available=${MEM_AVAIL},Percent=${PERCENT}"
TIME=$(date +%s%N)

echo "${MEASUREMENT}","${TAG_KEYS}" "${FIELD_KEYS}" "${TIME}"
