import psutil
import time


result_cpu = psutil.cpu_percent(interval=0.2)
time = time.time_ns()

print(f"cpu = {result_cpu}% {time}")
