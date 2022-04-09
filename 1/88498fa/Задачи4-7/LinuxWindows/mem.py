import psutil
import platform
from time import time_ns

print(
    f"memory,host={platform.node()} memory_used_gb={psutil.virtual_memory().used / (2**30)} {time_ns()}")
