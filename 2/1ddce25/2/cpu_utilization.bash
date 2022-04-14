#!/bin/bash

cpu_first=($(head -n1 /proc/stat))
sleep 0.5
cpu_second=($(head -n1 /proc/stat))

cpu_first_sum="${cpu_first[@]:1}" 
cpu_first_sum=$((${cpu_first_sum// /+}))


cpu_second_sum="${cpu_second[@]:1}"
cpu_second_sum=$((${cpu_second_sum// /+}))

cpu_delta=$((cpu_second_sum - cpu_first_sum))
cpu_idle=$((cpu_second[4]- cpu_first[4]))
cpu_used=$((cpu_delta - cpu_idle))
cpu_utilization=$((100 * cpu_used / cpu_delta)) 

timestamp=$(date +%s%N)

echo "cpu bash_utilization=$cpu_utilization $timestamp"
