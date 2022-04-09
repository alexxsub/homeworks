#!/bin/bash

TOTAL=`free -m | grep Mem | awk '{print $2}'`
USED=`free -m | grep Mem | awk '{print $3}'`

MEMUSAGE=`bc <<< "${USED}*100/${TOTAL}"`

TIMESTAMP=`date +%s%N`

echo "mem_usage percent=$MEMUSAGE $TIMESTAMP"