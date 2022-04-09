''' requirements:
pip isntall psutil

output:
	cpu_total - all cpu load
	cpu_0=35.8 - cpu load core № 0
	cpu_1=41.5 - cpu load core № 1
	...
	
example:
    win_processor,devId=PC-ADM cpu_0=35.8,cpu_1=41.5,cpu_2=32.8,cpu_3=41.5,cpu_total=37.9 1648721068
'''
import psutil
import time
import os

if os.name == 'nt':
    out = f"win_processor,devId={os.environ['COMPUTERNAME']} "
elif os.name == 'posix':
    out = f"posix_processor,fdevId={os.uname()[1]} "

cpu = 0
cpu_all = psutil.cpu_percent(1,percpu=True)
for i in range(len(cpu_all)):
    out += f'cpu_{i}={cpu_all[i]},'
    cpu += cpu_all[i]

out += f'cpu_total={ round( (cpu/len(cpu_all)), 2 ) } {int(time.time()) }'

print(out)
