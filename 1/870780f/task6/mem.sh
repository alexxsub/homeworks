#!/bin/bash
total=$(grep MemTotal /proc/meminfo | awk '{ print $2 }')
free=$(grep MemAvailable /proc/meminfo | awk '{ print $2 }')
usemem=$((total-free))
usemem_percent=$(bc<<<"scale=5;$usemem/$total*100")
usemem_percent=$(printf '%3.2f\n' $usemem_percent)
echo -n "memory,host=linux usage_percent=$usemem_percent,usage_kbytes=$usemem `date +%s`"