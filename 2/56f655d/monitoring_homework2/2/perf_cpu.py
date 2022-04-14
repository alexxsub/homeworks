import socket
import psutil

if __name__ == '__main__':
    cpu_busy = psutil.cpu_percent(1)
    cpu_usage = "{measurement},host={host} used_percent={util}".format(
        measurement="cpu_busy", host=socket.gethostname(), util=cpu_busy)
    print(cpu_usage)
