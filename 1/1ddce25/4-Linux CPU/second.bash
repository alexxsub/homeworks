#!/bin/bash

cpu_utilization=$(grep 'cpu ' /proc/stat | awk '{print ($2+$4)*100/($2+$4+$5)}')
timestamp=$(date +%s%N)

echo "cpu utilization=$cpu_utilization $timestamp"
