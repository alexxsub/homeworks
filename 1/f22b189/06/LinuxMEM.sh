#!/bin/bash
MEM=$(free | awk '/Память:|Mem:/{printf("%.2f"), $3/$2*100}')
echo Metrics,tag1=cpu fieldKey="CpuUtil" $( printf "%.2f" $MEM )
