#!/usr/bin/env python
import psutil
import time

p = psutil.cpu_percent(interval=1)

print("cpu cpu_usage_percent=" + str(psutil.cpu_percent(interval=1)) + " " + str(int(time.time()*1000000000)))
