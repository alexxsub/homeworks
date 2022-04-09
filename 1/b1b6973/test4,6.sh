!# /bin/bash

MEASUREMENT='CPU'
TAG_KEYS='host=Linux'
FIELD_KEYS=$(grep 'cpu ' /proc/stat | awk '{print($2+$4)*100/($2+$4+$5)}')
TIME=$(date +%s%N)
echo "${MEASUREMENT}" "${TAG_KEYS}" percent="${FIELD_KEYS}" "${TIME}"

MEASUREMENT='MEMORY'
TAG_KEYS='host=Linux'
MEM_TOTAL=$(grep 'MemTotal' /proc/meminfo | awk '{print($2)}')
MEM_FREE=$(grep 'MemFree' /proc/meminfo | awk '{print($2)}')
MEM_USED=$((${MEM_TOTAL} - ${MEM_FREE}))
FIELD_KEYS="Total=${MEM_TOTAL},Free=${MEM_FREE},Used=${MEM_USED}"
TIME=$(date +%s%N)

echo "${MEASUREMENT}" "${TAG_KEYS}" "${FIELD_KEYS}" "${TIME}"