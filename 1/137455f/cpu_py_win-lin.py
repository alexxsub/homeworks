#!/usr/bin/python3
import psutil
import datetime
import platform

hostname=platform.node()
cpu_ut=psutil.cpu_percent(interval=1)
time_meas=datetime.datetime.now().timestamp()

print("cpu, host="+str(hostname)+",contur=prod cpu_utilization="+str(cpu_ut)+" "+str(round(time_meas)))


