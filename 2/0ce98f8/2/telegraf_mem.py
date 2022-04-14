#!/bin/env python3
# Python script for getting ram usage in flux line protocol format

import psutil
import datetime, time

cpu = psutil.cpu_percent()
timestamp = int(time.mktime(datetime.datetime.now().timetuple())*1000000000)
free_ram = psutil.virtual_memory().free // 1000000000
print("free_ram,main_host=win_server free_ram={} {}".format(free_ram, timestamp))