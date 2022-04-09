import psutil
import time 
ram_usage = psutil.virtual_memory().percent
time_marker = time.time_ns() 
print(f'ram_usage percent="{ram_usage}" {time_marker}')