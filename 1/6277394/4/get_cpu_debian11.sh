#!/usr/bin/env bash
##----------------------
## requirements 
## debian 11:
##  apt-get install sysstat
##  
##----------------------
z=-1
msg=""
id=$(hostname)
array=$(mpstat -P ALL -o JSON | awk '/idle/ {print $22}' | grep -Po "(\d+.\d+)")
for t in ${array[@]}; do
    #add cpu {cpu_total}={value}
	if [[ "$z" -eq -1 ]]; then
	  msg="posix_processor,devId=$id cpu_total=$t"
	  z=$((z+1))
	  continue
	fi;
	#add cpu_{id}={value}
	msg="$msg,cpu_$z=$t"
	#counter +1
	z=$((z+1))
    
done
#add timestamp

echo "$msg $(date +%s)"


