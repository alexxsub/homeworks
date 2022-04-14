#!/bin/bash


for ((i=0; i < 2; i++))
do
# Get the first line with aggregate of all CPUs 
cpu_now=($(head -n1 /proc/stat))  
cpu_sum[i]="${cpu_now[@]:1}"
cpu_sum[i]=$((${cpu_sum[i]// /+})) 
echo ${cpu_sum[i]} ${cpu_now[4]} ${cpu_now[@]}
# Get the idle time 
cpu_idle[i]=${cpu_now[4]}
sleep 1
done 

# Get the delta between two reads 
cpu_delta=$((${cpu_sum[1]}-${cpu_sum[0]}))
# Get used time
cpu_used=$(( cpu_delta-${cpu_idle[1]}+${cpu_idle[0]} ))

#getting utilization cpu, interval = 1s
cpu_util=$( echo "scale=1;100*$cpu_used/$cpu_delta" | bc ) 

# getting the timestamp
timestamp=$( echo "$(date +"%s.%N") * 1000000000/1" | bc)

echo "CPU,host=$HOSTNAME,collector=my_bash busy_percent=$cpu_util $timestamp" 
