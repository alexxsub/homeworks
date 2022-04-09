#!/bin/bash

TS=$(date +%s%N)
LA=$(cat /proc/loadavg)
LA1=$( echo $LA | cut -d ' ' -f 1 )
LA5=$( echo $LA | cut -d ' ' -f 2 )
LA15=$( echo $LA | cut -d ' ' -f 3 )

echo loadavg,task=4 LA1=$LA1,LA5=$LA5,LA15=$LA15 $TS
