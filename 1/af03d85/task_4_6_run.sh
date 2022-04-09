#!/bin/bash
if ! [[ $1 == '-c' ||  $1 == '-m' ]]; then
    echo Error is here! Put -m or -c
    exit 1
fi
  

if [[ $1 == '-c' ]]
then
    outline_vmstat=$(vmstat | sed -n '3p')
    us=$(echo $outline | awk '{print $13}')
    sy=$(echo $outline | awk '{print $14}')
    id=$(echo $outline | awk '{print $15}')
    wa=$(echo $outline | awk '{print $13}')
    
    echo cpu,host=$(hostname),usage_user=${us:-0},usage_system=${sy:-0},usage_idle=${id:-0},usage_io=${wa:-0},$(date +"%s%N")
else
    outline_memory=$(free -b | sed -n '2p')
    outline_swap=$(free -b | sed -n '3p')
    total=$(echo $outline_memory | awk '{print $2}')
    used=$(echo $outline_memory | awk '{print $3}')
    free=$(echo $outline_memory | awk '{print $4}')
    avail=$(echo $outline_memory | awk '{print $7}')
    swap_total=$(echo $outline_swap | awk '{print $2}')
    swap_free=$(echo $outline_swap | awk '{print $4}')

    echo mem,host=$(hostname),total=${total:-0},used=${used:-0},free=${free:-0},available=${avail:-0},swap_total=${swap_total:-0},swap_free=${swap_free:-0},$(date +"%s%N")
fi