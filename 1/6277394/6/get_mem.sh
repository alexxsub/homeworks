#!/usr/bin/env bash
id=$(hostname)
raw=$(free --mega | grep 'Mem')
total=$( echo $raw | awk -F " " '{print $2}')
used=$( echo $raw | awk -F " " '{print $3}')
free=$( echo $raw | awk -F " " '{print $4}')
available=$( echo $raw | awk -F " " '{print $7}')

echo "posix_mem,devId=$id total_mem=$total,free_mem=$free,aval_mem=$available $(date +%s)"
