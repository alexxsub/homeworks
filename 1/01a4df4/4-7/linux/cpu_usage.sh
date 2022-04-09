#!/bin/bash

result=$(grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {OFMT="%.1f"; print usage}')
echo "cpu_usage percent=$result $(date +%s%N)"
