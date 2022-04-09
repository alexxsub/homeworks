import psutil

from flux_formatter import to_flp

print(to_flp('cpu_load', {'cpu_load': psutil.cpu_percent()}))
