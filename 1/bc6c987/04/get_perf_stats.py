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

# NOTE! Example: $ python get_perf_stats.py cpu 3 > Get the CPU(s) stats 3 times in a row!
# NOTE! Example: $ python get_perf_stats.py mem 3 > Get Free Memory stats 3 times in a row!
# NOTE! Example: $ python get_perf_stats.py       > By default: Get the CPU/MEM stats just once!

# NOTE!
# magenta='\033[0;35m'
# cyan='\033[0;36m'
# clear='\033[0m'

import sys
import psutil
import os
import datetime
import socket
import time

class get_performance_class:

  # Declaring of 'Show requisites' Function: #####################################
  def show_reqs(self):
    print ("--------------------------------------------------------------------")
    print ("programmer    : Yuri P. Bodrov")
    print ("e-mail        : bodrovyp@hotmail.com")
    print ("phoneNumber   : +79259929596")
    print ("telegram      : @YuriBodrov")
    print ("linkedin_page : https://www.linkedin.com/in/yuribodrov/")
    print ("--------------------------------------------------------------------")
    print ("FLUX LINE PROTOCOL MANNER. GET SOME PERFORMANCE (CPU/MEM) STATISTICS")
  ################################################################################ 
  
  # Declaring of 'Clear Screen' Function: #####################
  def clear_screen(self):
    # For Mac and Linux (in this case > os.name is 'posix')
    if os.name == 'posix':
      _ = os.system('clear')
    else:
    # For Windows platform
      _ = os.system('cls')
  #############################################################

  # Declaring of 'Get the Timestamp' Function: ################
  def get_timestamp(self):
    now_val = datetime.datetime.now()
    timestamp_str = now_val.strftime("%d%m%Y%H%M%S")

    return timestamp_str
  #############################################################

  # Declaring of 'CPUs Loading Collector' Function: ###########
  def get_cpu_loading(self):
    # Collect summation every second:
    cpu_time_val = psutil.cpu_percent(1) 

    return cpu_time_val
  #############################################################

  # Declaring of 'Free Memory Collector' Function: ############
  def get_free_mem(self):
    mem_summary = psutil.virtual_memory()
    mem_tmp_free = int(mem_summary.free / 1048576)
    mem_tmp_buf = int(mem_summary.buffers / 1048576)
    mem_tmp_cache = int(mem_summary.cached / 1048576)

    mem_tmp_val = mem_tmp_free + mem_tmp_buf + mem_tmp_cache

    return mem_tmp_val
  #############################################################

  # Declaring of 'CPU Formatted Output' Function: ###########################################
  def cpu_format_output(self, period):
    
    hostn = socket.gethostname()

    gp_class = get_performance_class()
    
    print ("\033[0;35mCPUs\033[0m")
    print ('-' * 90)
    
    for i in range(0, int(period), 1):
      # Function init > get_cpu_loading()
      cpus_str = '\033[0;35m'+str(gp_class.get_cpu_loading())+'\033[0m' # Set 'Magenta' color
      time_st = gp_class.get_timestamp()
      
      # For a nice output : ##########################
      substr_01 = "\033[0;35mcpu(s)_loading(%)\033[0m"
      substr_02 = "total_cpus_load="
      
      print (hostn + "," + substr_01 + " " + substr_02 + cpus_str + " " + time_st)

    print ('-' * 90)
    time.sleep(1)
    print (' ' * 86 + "\033[0;35mDONE\033[0m")
  ###########################################################################################

  # Declaring of 'CPU Formatted Output' Function: ###########################################
  def mem_format_output(self, period):
    
    hostn = socket.gethostname()

    gp_class = get_performance_class()
    
    print ("\033[0;36mMEM\033[0m")
    print ('-' * 90)
    
    for i in range(0, int(period), 1):
      # Function init > get_free_mem()
      mem_str = '\033[0;36m'+str(gp_class.get_free_mem())+'\033[0m' # Set 'Cyan' color
      time_st = gp_class.get_timestamp()
      
      # For a nice output : ###########################
      substr_01 = "\033[0;36mfreemem_amount(MB)\033[0m"
      substr_02 = "free_memory="
      
      print (hostn + "," + substr_01 + " " + substr_02 + mem_str + " " + time_st)
      time.sleep(1)

    print ('-' * 90)
    time.sleep(1)
    print (' ' * 86 + "\033[0;36mDONE\033[0m")
  ###########################################################################################


def main():                             # Declaring a Main Function
  
  gp_class = get_performance_class()    # Initialize a New Instance of get_performance_class()
  gp_class.clear_screen()               # Clear the Screen 
  gp_class.show_reqs()                  # Show the Requisites

  print ()

  try:

    if len(sys.argv) == 1:              # Running by Default:
      gp_class.cpu_format_output(1)     # Get the CPU Loading Performance 
      gp_class.mem_format_output(1)     # and Free Memory Data just once:
  
    elif (str(sys.argv[1]) == 'cpu') and (int(sys.argv[2]) >= 1):
      # Get the CPU Loading Performance Data N times:
      gp_class.cpu_format_output(sys.argv[2])  

    elif (str(sys.argv[1]) == 'mem') and (int(sys.argv[2]) >= 1):
      # Get Free Memory Amount Performance Data N times:
      gp_class.mem_format_output(sys.argv[2])

    print ()
  
  except Exception as error:
    print ("You have got some error:" + "\n" + "---")
    print (error)

    print ()

if __name__ == "__main__":
  main()

###################################################################################################