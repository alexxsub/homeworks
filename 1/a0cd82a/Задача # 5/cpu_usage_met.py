#!/usr/bin/python

import psutil
import time

cpu_percent_cores = psutil.cpu_percent(interval=2, percpu=True)
avg = sum(cpu_percent_cores)/len(cpu_percent_cores)
cpu_percent_total_str = ('%.2f' % avg)

print('cpu_usage percent={}'.format(cpu_percent_total_str)+'',time.time_ns())
