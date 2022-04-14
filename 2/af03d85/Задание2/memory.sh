#!/bin/bash
outline_memory=$(free -b | sed -n '2p')
total=$(echo $outline_memory | awk '{print $2}')
used=$(echo $outline_memory | awk '{print $3}')

echo memory,host=$(hostname),type=bash_scrypt total=${total:-0},used=${used:-0} $(date +"%s%N")
