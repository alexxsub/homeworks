#!/usr/bin/python3
import psutil
import time


def get_ram_usage():
    return (int(psutil.virtual_memory().total - psutil.virtual_memory().available))

mem_percent = round((get_ram_usage()/int(psutil.virtual_memory().total))*100,2)
print("memory,host=linux memory_usage=" + str(mem_percent) + " " + str(int(time.time_ns())))
