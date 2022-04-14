#! /bin/bash

MEASUREMENT="CPU_bash"
TAG_KEYS="host=\"Ubuntu1\""
FIELD_KEYS=$(awk '{u=$2+$4; t=$2+$4+$5; if (NR==1){u1=u; t1=t;} else print ($2+$4-u1) * 100 / (t-t1); }' <(grep 'cpu ' /proc/stat) <(sleep 1; grep 'cpu ' /proc/stat))
TIME=$(date +%s%N)

echo "${MEASUREMENT}","${TAG_KEYS}" percent="${FIELD_KEYS}" "${TIME}"
