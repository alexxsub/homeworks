#!/usr/bin/env python3 

from psutil import cpu_percent
from time import time_ns


timestamp = time_ns()
cpu_utilization = cpu_percent(interval=0.2)

print(f"cpu utilization={cpu_utilization} {timestamp}")
