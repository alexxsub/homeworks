#!/bin/bash
stat1=($(head -n 1 /proc/stat))
fullcpu1="${stat1[@]:1}"
fullcpu1=$((${fullcpu1// /+}))

sleep 1

stat2=($(head -n 1 /proc/stat))
fullcpu2="${stat2[@]:1}"
fullcpu2=$((${fullcpu2// /+}))
fullcpu_delta=$((fullcpu2 - fullcpu1))
idle=$((stat2[4]- stat1[4]))
usage=$(bc<<<"scale=5;(1-$idle/$fullcpu_delta)*100")
usage=$(printf '%3.2f\n' $usage)
echo -n "cpu,host=linux usage_percent=$usage `date +%s%N`"