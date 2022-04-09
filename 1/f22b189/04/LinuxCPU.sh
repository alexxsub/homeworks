#!/bin/bash

CPU=$(top -bn 2 -d 0.01 | grep '^%Cpu' | tail -n 1 | gawk '{print $2+$4+$6}')
echo Metrics,tag1=cpu fieldKey="CpuUtil" $( printf "%.2f" $CPU )

