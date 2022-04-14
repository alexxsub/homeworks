import psutil, time;

ts = time.time_ns()
cpu = psutil.cpu_percent(1)

print(f"cpu_used,command=PY cpu_percent={cpu:.2f} {ts}")