from time import time_ns
from platform import node
from psutil import cpu_times_percent

def get_cpu_idle():
    return(int(cpu_times_percent(interval=1)[3]))
if __name__ == '__main__':
     print(f'cpu,host={node()},type=psutil_scrypt usage_idle={get_cpu_idle()} {int(time_ns())}')
