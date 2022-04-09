from datetime import datetime
import time
import os
import socket

dt = datetime.now()
ts = datetime.timestamp(dt)
ts1 = time.time()
host1 = socket.gethostname()

cpu=str(round(float(os.popen('''grep 'cpu ' /proc/stat | awk '{use=($2+$4+$3)*100/($2+$3+$4+$5)} END {print use }' ''').readline()),2))
cpu1 = (os.popen('cat /proc/loadavg').read()).split()

print("CPU, host=",host1, "cpu_perc_use=",cpu, ",cpu_1m=",cpu1[0], ",cpu_5m=",cpu1[1], ",cpu_15m=",cpu1[2], ts )