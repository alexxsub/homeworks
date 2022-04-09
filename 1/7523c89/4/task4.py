import time;

ts = time.time_ns()

with open('/proc/loadavg', 'r') as f:
    for line in f:
        la = line.split()

print(f"loadavg,task=4 LA1={la[0]},LA5={la[1]},LA15={la[2]} {ts}")
