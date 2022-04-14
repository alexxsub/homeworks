import socket
import psutil

if __name__ == '__main__':
    mem = psutil.virtual_memory().percent
    mem_usage = "{measurement},host={host} used_percent={util}".format(
        measurement="mem_usage", host=socket.gethostname(), util=mem)
    print(mem_usage)
