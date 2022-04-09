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
        mem_usage = metrics('mem_use', psutil.virtual_memory().percent) 
        print('mem_usage',mem_usage)
        time.sleep(2)