#!/usr/bin/python3

import psutil
import time
import os

hostname = os.uname().nodename
cpu_percent_cores = psutil.cpu_percent(interval=2, percpu=True)
avg = sum(cpu_percent_cores)/len(cpu_percent_cores)
cpu_percent_total_str = ('%.2f' % avg)

print('cpu,cpu=cpu_total,host='+str(hostname)+' ' 'psutil={}'.format(cpu_percent_total_str)+'',time.time_ns())
