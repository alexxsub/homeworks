import psutil
import platform
from time import time_ns

print(
    f"cpu,host={platform.node()} cpu_percent={psutil.cpu_percent(0.1)} {time_ns()}")
