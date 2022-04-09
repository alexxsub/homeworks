#!/bin/bash

cpu_idle=$(top -bn1 | grep "Cpu(s)" | \
           sed "s/.*, *\([0-9][0-9]\,[0-9]*\)%* id.*/\1/" | \
	   sed -r 's/,/./g'
	)

cpu_usage=$(awk "BEGIN { printf(\"%2.1f\", (100-$cpu_idle)); }")

echo "cpu_usage,cpu_usage=$cpu_usage "$(date +%s%N)
