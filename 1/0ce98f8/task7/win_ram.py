#!/bin/env python3
# Python script for getting memory usage in flux line protocol format

import psutil
import datetime, time

cpu = psutil.cpu_percent()
timestamp = time.mktime(datetime.datetime.now().timetuple())
total_ram = psutil.virtual_memory().available // 1000000
used_ram = psutil.virtual_memory().used // 1000000
free_ram = psutil.virtual_memory().free // 1000000

print("ram_stat,main_host=server1 total_ram={},used_ram={},free_ram={} {}".\
		format(total_ram, used_ram, free_ram, timestamp))