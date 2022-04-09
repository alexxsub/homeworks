#!/usr/bin/python

import psutil
import time

print('memory_usage percent={}'.format(psutil.virtual_memory()[2])+'',time.time_ns())