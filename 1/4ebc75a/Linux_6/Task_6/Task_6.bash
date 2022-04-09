#!/bin/sh

Musage=$(free | awk '/Mem/{printf("RAM Usage: %.2f%\n"), $3/$2*100}' |  awk '{print $3}' | cut -d"." -f1)

DATE=$(date +%s%N)

MEM_USAGE="Memory usage $Musage% $DATE"

echo "$MEM_USAGE"
