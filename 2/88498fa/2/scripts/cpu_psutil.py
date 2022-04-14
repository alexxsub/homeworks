import psutil
import platform
from time import time_ns

print(
    f"cpu,host={platform.node()},script=cpu_py cpu_percent={psutil.cpu_percent(1)} {time_ns()}")
