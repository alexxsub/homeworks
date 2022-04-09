#!/bin/bash
mem_total=( $(top -bn1 | grep "MiB Mem" | awk -F, '{print $1}' | awk -F" " '{print $4}' | awk '{printf("%d\n",$1 + 0.5)}') )
mem_used=( $(top -bn1 | grep "MiB Mem" | awk -F, '{print $3}' | awk -F" " '{print $1}' | awk '{printf("%d\n",$1 + 0.5)}') )

mem_used_percent=$(bc<<<"scale=1;$mem_used*100")
mem_used_percent=$(bc<<<"scale=1;$mem_used_percent/$mem_total")
time_marker=$(date +%s%N)
echo mem_usage percent=\"$mem_used_percent\" $time_marker