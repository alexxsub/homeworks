#!/usr/bin/python3
import psutil
import time

print("cpu,host=linux usage_percent=" + str(psutil.cpu_percent(interval=1)) + " " + str(int(time.time())))
