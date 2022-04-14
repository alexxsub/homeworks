#!/bin/bash
cpu_count=`grep '^processor' /proc/cpuinfo | wc -l`
tatr=`ps -axeo pcpu | grep -v '^ 0.0' | grep -v CPU | tr -d '.'`
IFS=$'\r\n'
for var in $tatr
do
proc=$((proc+var))
done
proc=$((proc/cpu_count))
cpuproc1=$((proc/10))"."$((proc%10))
echo "$cpuproc1"
