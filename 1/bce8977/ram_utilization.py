import psutil

from flux_formatter import to_flp

print(to_flp('ram_utilization', {'ram_utilization': psutil.virtual_memory().percent}))
