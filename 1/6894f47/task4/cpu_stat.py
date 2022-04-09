#!/usr/bin/env python3
from datetime import datetime
try:
    from psutil import cpu_times_percent
except ModuleNotFoundError:
    print("Нужно установить psutil:\npython3 -m pip install -U psutil")
    exit(1)

timestamp = int(datetime.timestamp(datetime.now()))

for c in enumerate(cpu_times_percent(percpu=True, interval=1)):
    print(f"cpu,core_num={c[0]},type=cpu cpuload={100-c[1].idle} {timestamp}")
