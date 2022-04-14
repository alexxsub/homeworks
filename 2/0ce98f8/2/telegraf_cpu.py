#!/bin/env python3
# Python script for getting cpu usage in flux line protocol format

import psutil
import datetime, time, calendar

cpu = psutil.cpu_percent(interval=0.5)
timestamp = int(time.mktime(datetime.datetime.now().timetuple())*1000000000)
print("cpu_busy,main_host=win_server cpu_busy={} {}".format(cpu, timestamp))