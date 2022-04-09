#!/bin/bash
cpu_usage=( $(top -bn1 | grep "Cpu(s)" | awk -F, '{print $4}' | awk -F" " '{print 100 - $1}') )
time_marker=$(date +%s%N)
echo cpu_usage percent=\"$cpu_usage\" $time_marker