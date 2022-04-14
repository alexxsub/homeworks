#!/bin/bash
outline_vmstat=$(vmstat 2 2 | sed -n '4p')
idle=$(echo $outline_vmstat | awk '{print $15}')
echo cpu,host=$(hostname),type=bash_scrypt usage_idle=${idle:-0} $(date +"%s%N")
