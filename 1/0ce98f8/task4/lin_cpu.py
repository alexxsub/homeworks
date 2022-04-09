#!/bin/env python3
# Python script for getting cpu usage in flux line protocol format

import psutil
import datetime, time

cpu = psutil.cpu_percent()
timestamp = time.mktime(datetime.datetime.now().timetuple())

print("cpu_busy,main_host=server1 cpu_busy{} {}".format(cpu, timestamp))