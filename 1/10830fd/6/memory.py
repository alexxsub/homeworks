from datetime import datetime
import time
import os
import socket
#import psutil

dt = datetime.now()
ts = datetime.timestamp(dt)
x = time.time()
host1 = socket.gethostname()
#swap total_mem, used_mem, free_mem = map(int, os.popen('free').readlines()[-1].split()[1:])
mem = (os.popen('free | grep Mem').read()).split()
print("Memory, host=",host1, "total_mem=",mem[1],",used_mem=",mem[2],",free_mem=",mem[3], ts )