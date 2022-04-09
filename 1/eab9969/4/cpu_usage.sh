#!/bin/bash

IDLE=`top -b -n 1 | grep Cpu | awk '{print $8}'`

CPUUSAGE=`bc <<< "100 - ${IDLE}"`

TIMESTAMP=`date +%s%N`

echo "cpu_usage percent=$CPUUSAGE $TIMESTAMP"