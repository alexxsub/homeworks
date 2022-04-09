import psutil
from datetime import datetime


cpu = []
mem = []
cpu.append("{measurement},location={location} busy_percent={busy_percent} {timestamp}"
            .format(measurement="cpu",
                    location="windows",
                    busy_percent=psutil.cpu_percent(interval=1),
                    timestamp=datetime.now().timestamp()))
mem.append("{measurement},location={location} busy_percent={busy_percent} {timestamp}"
            .format(measurement="memory",
                    location="windows",
                    busy_percent=psutil.virtual_memory().percent,
                    timestamp=datetime.now().timestamp()))


print(cpu)
print(mem)