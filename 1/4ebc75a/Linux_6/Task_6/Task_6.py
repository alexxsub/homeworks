#!/home/ansible/ansivenv/bin/python3

import psutil
import time


result_mem = psutil.virtual_memory().percent
time = time.time_ns()

print(f"mem = {result_mem}% {time}")
