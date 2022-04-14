import psutil
import platform
import time
import argparse

parser = argparse.ArgumentParser(description='Script to measure memory and cpu utilization')
parser.add_argument('-m', dest='metric', default='cpu', type=str, required=False,
                    help='set a metric: cpu or memory')

args = parser.parse_args()

# hostname
myhost = platform.uname()[1]

# get metrics
if args.metric == 'memory':
    vmem = psutil.virtual_memory()
    value = vmem.percent
elif args.metric == 'cpu':
    value=psutil.cpu_percent(interval=1)
else:
    raise ValueError(f"Invalid argument: {args.metric}")

# getting the timestamp
ts = time.time()
timestamp = int(ts*1000000000)


print(f'{args.metric},host={myhost},collector=my_python busy_percent={value} {timestamp}')