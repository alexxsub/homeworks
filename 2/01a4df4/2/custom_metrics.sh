#!/bin/bash

cpu_usage=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{OFMT="%.1f"; print 100 - $1}')
mem_usage=$(free | grep Mem | awk '{OFMT="%.1f"; print $3/$2 * 100}')

echo "cpu_usage percent=$cpu_usage $(date +%s%N)"
echo "mem_usage percent=$mem_usage $(date +%s%N)"
