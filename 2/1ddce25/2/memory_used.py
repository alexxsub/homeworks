#!/usr/local/bin/python3.9

from psutil import virtual_memory
from time import time_ns


timestamp = time_ns()
memory_used = virtual_memory().percent

print(f"mem py_used={memory_used} {timestamp}")
