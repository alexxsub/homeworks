#!/bin/sh

cpu_load=$(top -bn1 | grep  'Cpu(s)' | tr -s ',' '.' | awk '{ print (100.0 - $8) }')
time_stamp=$(date +%s%N)

echo -n "cpu_busy host=$(hostname) percent=$cpu_load $time_stamp"
