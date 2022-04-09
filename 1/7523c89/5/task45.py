import psutil, time;

ts = time.time_ns()
cpu = psutil.cpu_percent(1)

print(f"CPU_used,task=5 %CPU_time={cpu} {ts}")
