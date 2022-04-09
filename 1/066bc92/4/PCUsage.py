#!/usr/bin/python3
import psutil
import time
import sys

if __name__ == '__main__':

    timestamp = int(time.time())
    try:
        args = sys.argv
        if (len(args) == 2):
            if (sys.argv[1] == "cpu") or (sys.argv[1] == "mem"):
                if (sys.argv[1] == "cpu"):
                    print("cpu, Usage_percent=" + str(psutil.cpu_percent(interval=2)) + " " + str(timestamp))
                else:
                    print("mem, Usage_percent=" + str(psutil.virtual_memory().percent) + " " + str(timestamp))
        
            elif (sys.argv[1]== "help" or sys.argv[1] == "-help"):
                print ("Script shows CPU or Memory usage parameter")
                print ("Example: \"PCUsage.py cpu\" - will return CPU usage")
                print ("Example: \"PCUsage.py mem\" - will return memory usage")
            else:
                print ("Incorrect parameters! Read help for more information.")
        else:
            print ("Incorrect number of parameters! Read help for more information.")
    except IndexError:
        print ("Incorrect parameters! Read help for more information.")

