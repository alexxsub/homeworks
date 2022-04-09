#!/bin/bash

memory_used=$(free -m | grep "Mem" | awk '{print (1-$7/$2)*100}')
timestamp=$(date +%s%N)

echo "memory used=$memory_used $timestamp"
