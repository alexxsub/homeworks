#!/bin/bash

OS=Linux
HOST=`hostname`
TOP=`top -bn1`
MEASURE=`echo "$TOP" | grep "Cpu(s)" | grep -Po ".*(?=Cpu\(s\))" | head -n 1`
US=`echo "$TOP" | grep "Cpu(s)" | grep -Po "\d*.\d*(?=\sus,)" | head -n 1`
SY=`echo "$TOP" | grep "Cpu(s)" | grep -Po "\d*.\d*(?=\ssy,)" | head -n 1`
NY=`echo "$TOP" | grep "Cpu(s)" | grep -Po "\d*.\d*(?=\sny,)" | head -n 1`
ID=`echo "$TOP" | grep "Cpu(s)" | grep -Po "\d*.\d*(?=\sid,)" | head -n 1`
WA=`echo "$TOP" | grep "Cpu(s)" | grep -Po "\d*.\d*(?=\swa,)" | head -n 1`
HI=`echo "$TOP" | grep "Cpu(s)" | grep -Po "\d*.\d*(?=\shi,)" | head -n 1`
SI=`echo "$TOP" | grep "Cpu(s)" | grep -Po "\d*.\d*(?=\ssi,)" | head -n 1`
ST=`echo "$TOP" | grep "Cpu(s)" | grep -Po "\d*.\d*(?=\sst)" | head -n 1`

echo "measurement_cpu,host=$HOST,os=$OS,measure=$MEASURE us=$US,sy=$SY,ny=$NY,id=$ID,wa=$WA,hi=$HI,si=$SI,st=$ST $(date +%s%N)"