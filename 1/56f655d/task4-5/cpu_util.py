import socket
import psutil
import time

def metrics(perf,func_value):
    data = []
    data.append("{measurement},host={host} used_percent={util}"
                .format(measurement=perf,
            host=socket.gethostname(),
                        util=func_value))
    return data

if __name__ == '__main__':
    while True:
        cpu_usage = metrics('cpu_util',psutil.cpu_percent()) 
        print('cpu_usage',cpu_usage)
        time.sleep(2)