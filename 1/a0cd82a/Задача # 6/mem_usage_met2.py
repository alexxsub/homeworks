#!/usr/bin/python

import os
import time  

total_memory, used_memory, free_memory = map(
    int, os.popen('free -t -m').readlines()[-1].split()[1:])

print('memory_usage percent={}'.format(round((used_memory/total_memory) * 100, 2))+'',time.time_ns())