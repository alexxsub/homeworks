#!/bin/sh
# Bash script for getting memory usage in flux line protocol format

get_ram=$(free -m | grep Mem)
total_ram=$(echo $get_ram | awk '{print $2}')
used_ram=$(echo $get_ram | awk '{print 3}')
free_ram=$(echo $get_ram | awk '{print $4}')
time=$(date +%s)

echo ram_stat,main_host=server1 total_ram=$total_ram,used_ram=$used_ram,free_ram=$free_ram $time
