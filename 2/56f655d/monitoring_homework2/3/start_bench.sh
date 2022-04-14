#!/bin/bash

#Скрипт запускает в фоне $BENCH процессов с именем yes 

#Количество ядер в системе
KERNEL_COUNT=$(sysctl -n hw.ncpu)
#Процент используемых ядер
PERCENT=80
#Количество нагружаемых ядер
let "BENCH=$KERNEL_COUNT*$PERCENT/100"

for (( i=1; i <= 6; i++ ))
do
yes  > /dev/null &
done
echo "Start bench on $BENCH kernels"
echo "For stop bench process run ./stop_bench.sh"
