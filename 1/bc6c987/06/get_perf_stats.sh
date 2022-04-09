#!/bin/bash
# -------------------------------------------------------
# programmer    : Yuri P. Bodrov
# e-mail        : bodrovyp@hotmail.com
# phoneNumber   : +79259929596
# telegram      : @YuriBodrov
# linkedin_page : https://www.linkedin.com/in/yuribodrov/
# -------------------------------------------------------

### FLUX LINE PROTOCOL MANNER. GET SOME PERFORMANCE (CPU/MEM) STATISTICS ##########################

# NOTE! RECORD FORMAT : [measurement],[tag_set] [field_set] [timestamp]
# NOTE! [timestamp] FORMAT IS : %d%m%Y%H%M%S

# NOTE! 
# top -b -n 1 | grep Cpu | awk '{print $4}'  > CPU(s) Kernel Space Time (KST)!
# top -b -n 1 | grep Cpu | awk '{print $2}'  > CPU(s) User Space Time (UST)!
# top -b -n 1 | grep Cpu | awk '{print $6}'  > CPU(s) Manual Nice Time (MNT)!
# free -m | grep "Mem" | awk '{print $4+$6}' > Free Memory Amount (free + buf/cache) in MB (FMA)!

# NOTE! Example: $ sh get_perf_stats.sh cpu 3 > Get the CPU(s) stats 3 times in a row!
# NOTE! Example: $ sh get_perf_stats.sh mem 3 > Get Free Memory stats 3 times in a row!
# NOTE! Example: $ sh get_perf_stats.sh       > By default: Get the CPU/MEM stats just once!

# NOTE! For a nice output...)
# Color variables: ###############
red='\033[0;31m'
green='\033[0;32m'
magenta='\033[0;35m'
cyan='\033[0;36m'
# Clear the color after an output:
clear='\033[0m'
##################################

# Declaring a Print Welcome Method: #########################################
function print_welcome()
{
  echo "--------------------------------------------------------------------"
  echo "programmer    : Yuri P. Bodrov"
  echo "e-mail        : bodrovyp@hotmail.com"
  echo "phoneNumber   : +79259929596"
  echo "telegram      : @YuriBodrov"
  echo "linkedin_page : https://www.linkedin.com/in/yuribodrov/"
  echo "--------------------------------------------------------------------"
  echo "FLUX LINE PROTOCOL MANNER. GET SOME PERFORMANCE (CPU/MEM) STATISTICS"
  echo ""
}
#############################################################################

# Declaring a CPU(s) Loading Collector: ##################################################
function get_cpus_stats() 
{
  count=$1
  
  echo -e "Getting a ${magenta}CPU(s)${clear} loading statistics of '$HOSTNAME'. Begin..."
  echo "-------"
  
  substr_01="${magenta}$HOSTNAME,cpu(s)_loading(%)${clear}"
  substr_02="TotalCpusLoading="
  
  for i in $(seq "$count")
    do
      ust_val=$(top -b -n 1 | grep Cpu | awk '{print $2}')
      kst_val=$(top -b -n 1 | grep Cpu | awk '{print $4}')
      mnt_val=$(top -b -n 1 | grep Cpu | awk '{print $6}')
      timestamp=$(date '+%d%m%Y%H%M%S')
      total_cpu_load_val=$(echo "$ust_val+$kst_val+$mnt_val" | bc )

      echo -e "$substr_01 $substr_02${magenta}$total_cpu_load_val${clear} $timestamp"
      sleep 1 # Getting a pause for 1 second

    done

  echo "-------"
  echo -e "...End. Getting a ${magenta}CPU(s)${clear} loading statistics."
}
##########################################################################################

# Declaring a Free Memory Collector: ######################################################
function get_freemem_stats()
{
  count=$1
  echo -e "Getting a ${cyan}Free Memory${clear} amount statistics of '$HOSTNAME'. Begin..."
  echo "-------"
  substr_01="${cyan}$HOSTNAME,freemem_amount(MB)${clear}"
  substr_02="FreeMemory="

  for i in $(seq "$count")
    do
      fma_val=$(free -mlt | grep "Mem" | awk '{print $4+$6}')
      timestamp=$(date '+%d%m%Y%H%M%S')

      echo -e "$substr_01 $substr_02${cyan}$fma_val${clear} $timestamp"
      sleep 1

    done
  echo "-------"
  echo -e "...End. Getting a ${cyan}Free Memory${clear} amount statistics."
}
###########################################################################################

clear # Clear the screen

print_welcome # Run Print Welcome Method

if [ "$1" == "cpu" ] && [ $2 > 1 ]
  then
    get_cpus_stats $2 # Run the CPU(s) loading collector function with N repeats
    echo ""
    sleep 1
elif [ "$1" == "mem" ] && [ $2 > 1 ]
  then
    get_freemem_stats $2 # Run Free Memory collector function with N repeats
    echo ""
    sleep 1
else
  get_cpus_stats 1 # Run the CPU(s) loading collector function with 1 repeat
  echo ""
  echo ""
  sleep 1

  get_freemem_stats 1 # Run Free Memory collector function with 1 repeat
  echo ""
  sleep 1
fi

echo "--------------------------------------------------------------------"

sleep 1

echo "                                             THAT'S ALL. GOOD BYE! )"

echo ""

sleep 1
