import psutil, time;

ts = time.time_ns()
mem = psutil.virtual_memory()

print(f"Load_Memory,task=6 memory_total={mem.total},\
%memory_used={mem.percent:.2f},memory_free={mem.free} {ts}")
