''' requirements:
pip isntall psutil

output:
    PC-ADM_processor,devId=EXP-ADM cpu_0=35.8,cpu_1=41.5,cpu_2=32.8,cpu_3=41.5,cpu_total=37.9 1648721068
'''
import psutil
import time
import os
'''
requirements:
pip isntall psutil

output 
'''
if os.name == 'nt':
    out = f"win_processor,devId={os.environ['COMPUTERNAME']} "
elif os.name == 'posix':
    out = f"posix_processor,fdevId={os.environ['COMPUTERNAME']} "

cpu = 0
cpu_all = psutil.cpu_percent(1,percpu=True)
for i in range(len(cpu_all)):
    out += f'cpu_{i}={cpu_all[i]},'
    cpu += cpu_all[i]

out += f'cpu_total={ round( (cpu/len(cpu_all)), 2 ) } {int(time.time()) }'

print(out)
