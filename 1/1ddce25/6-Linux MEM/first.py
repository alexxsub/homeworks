#!/usr/bin/env python3 

from psutil import virtual_memory
from time import time_ns


timestamp = time_ns()
memory_used = virtual_memory().percent

print(f"memory used={memory_used} {timestamp}")
