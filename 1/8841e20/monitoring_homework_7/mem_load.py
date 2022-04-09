#!/usr/bin/env python3

import psutil
import time
import platform

mem = psutil.virtual_memory()
mem_used = mem.total - mem.available
mem_load = str(round(mem_used * 100 / mem.total, 2))

timestamp = str(time.time_ns())
host_name = platform.node()
res = "mem_busy host=" + host_name + " persent=" + mem_load + " " + timestamp

print(res)
