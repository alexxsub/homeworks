#!/bin/bash

result=$(free | grep Mem | awk '{OFMT="%.1f"; print $3/$2 * 100}')
#result=$(top -bn1 | grep "Mem" | head -1 | awk 'NR=1 {OFMT="%.1f";print $8/$4 * 100}')

echo "cpu_usage percent=$result $(date +%s%N)"
