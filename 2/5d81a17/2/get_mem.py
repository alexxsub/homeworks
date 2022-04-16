#!/usr/bin/env python

import psutil
import time

print("memory memory_usage_percent=" + str(psutil.virtual_memory().percent) + " " + str(int(time.time()*1000000000)))
