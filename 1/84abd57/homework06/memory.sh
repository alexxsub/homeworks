#!/bin/bash

OS=Linux
HOST=`hostname`
TOP=`top -bn1`
MEASURE=`echo "$TOP" | grep "Mem :" | grep -Po "\w*(?=\sMem\s:)" | head -n 1`
TOTAL=`echo "$TOP" | grep "Mem :" | grep -Po "\d*.\d*(?=\stotal)" | head -n 1`
FREE=`echo "$TOP" | grep "Mem :" | grep -Po "\d*.\d*(?=\sfree)" | head -n 1`
USED=`echo "$TOP" | grep "Mem :" | grep -Po "\d*.\d*(?=\sused)" | head -n 1`

echo "measurement_memory,host=$HOST,os=$OS,measure=$MEASURE total=$(($TOTAL+0)),free=$(($FREE+0)),used=$(($USED+0)) $(date +%s%N)"