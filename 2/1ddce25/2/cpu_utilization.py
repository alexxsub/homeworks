#!/usr/local/bin/python3.9

from psutil import cpu_percent
from time import time_ns


timestamp = time_ns()
cpu_utilization = cpu_percent(interval=0.2)

print(f"cpu py_utilization={cpu_utilization} {timestamp}")
