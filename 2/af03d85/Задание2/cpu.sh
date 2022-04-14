#!/bin/bash
outline_vmstat=$(vmstat 2 2 | sed -n '4p')
idle=$(echo $outline_vmstat | awk '{print $15}')
let load=100-$idle
echo cpu,host=$(hostname),type=bash_scrypt usage=${load:-0} $(date +"%s%N")
