import psutil
import time
import sys
import os

if __name__ == '__main__':
    print("cpu," + "host=" + str(os.environ['COMPUTERNAME']) + ",method=psutil" + " " + "Usage_percent=" + str(psutil.cpu_percent(interval=1,percpu=False)) + " " + str(time.time_ns()))

