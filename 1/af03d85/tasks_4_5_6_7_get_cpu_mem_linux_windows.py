from time import time_ns
from platform import node
from psutil import virtual_memory,cpu_percent

def get_cpu_usage_pct():
    return int(cpu_percent(interval=0.5))

def get_ram_usage():
    return int((virtual_memory().total - virtual_memory().available) / 1024 )

def get_ram_total():
    return int(virtual_memory().total / 1024 )

if __name__ == '__main__':
    print(f'cpu,hostname={node()},usage_percent={get_cpu_usage_pct()},{int(time_ns())}')
    print(f'mem,hostname={node()},total={get_ram_total()},used={get_ram_usage()},{time_ns()}')