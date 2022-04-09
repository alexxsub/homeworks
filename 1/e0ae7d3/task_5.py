import psutil
import time 
cpu_usage = psutil.cpu_percent(interval=1)
time_marker = time.time_ns() 
print(f'cpu_usage percent="{cpu_usage}" {time_marker}')