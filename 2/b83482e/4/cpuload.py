#!/usr/bin/python3

from psutil import cpu_percent
from time import time

cpuload = cpu_percent(1)
ts = str(time()).replace('.', '')+'00'

print(f'cpuinfo cpuloadpy={cpuload} {ts}')