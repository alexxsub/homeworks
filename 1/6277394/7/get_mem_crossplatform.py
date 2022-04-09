import psutil
import time
import os
'''
requirements:
pip isntall psutil
'''
if os.name == 'nt':
    out = f"win_mem,devId={os.environ['COMPUTERNAME']} "
elif os.name == 'posix':
    out = f"posix_mem,devId={os.uname()[1]} "

raw = dict(psutil.virtual_memory()._asdict())
available = round (raw['available']/1024/1024)
used=round (raw['used']/1024/1024)
free=round (raw['free']/1024/1024)
total=round (raw['total']/1024/1024)

out += f'available={ available},used={ used },free={ free},total={ total} {int(time.time()) }'

print(out)