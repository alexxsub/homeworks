import time
from psutil import cpu_percent


cpu=cpu_percent(interval=1);


print('cpu_usage,cpu_usage='+str(cpu)+' '+str(time.time_ns()));
