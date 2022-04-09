import psutil
import time
import socket


def get_cpu():
    la1, la5, la15 = psutil.getloadavg()
    return psutil.cpu_percent(), \
        float("{:.1f}".format(la1)), \
        float("{:.1f}".format(la5)), \
        float("{:.1f}".format(la15)), \
        time.time_ns()


def get_memory():
    _memory = dict(psutil.virtual_memory()._asdict())
    return _memory['percent'], \
        _memory["total"], \
        _memory["free"], \
        _memory["used"], \
        time.time_ns()


hostname = socket.gethostname()
while True:
    print('*'*40)
    cpu_per, la1, la5, la15, cpu_time = get_cpu()
    mem_busy_percent, mem_total, mem_free, mem_used, mem_time = get_memory()
    print(f'cpu,host={hostname},contur=home busy_percent={cpu_per},la1={la1},la5={la5},la15={la15} {cpu_time}')
    print(f'memory,host={hostname},contur=home busy_percent={mem_busy_percent},total={mem_total},free={mem_free},used={mem_used} {mem_time}')
    time.sleep(3)
