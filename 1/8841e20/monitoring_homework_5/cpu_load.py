#!/usr/bin/env python3

import psutil
import time
import platform

cpu_load = str(psutil.cpu_percent(interval=1))
timestamp = str(time.time_ns())
host_name = platform.node()
res = "cpu_busy host=" + host_name + " persent=" + cpu_load + " " + timestamp

print(res)
