#!/bin/bash

memory_used=$(free -m | grep "Mem" | awk '{print (1-$7/$2)*100}')
timestamp=$(date +%s%N)

echo "mem bash_used=$memory_used $timestamp"
