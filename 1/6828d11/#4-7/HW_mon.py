import psutil
import time
import argparse
import platform
timestamp = int(time.time())


parser = argparse.ArgumentParser(description='Utilization of system resources')
parser.add_argument('target', type=str, help='cpu to show CPU util, memory to show memory util')

args = parser.parse_args()

def print_cpu(timestamp):
    for i in range (psutil.cpu_count()):
         print(f"cpu, system={platform.uname()[0]},host={platform.uname()[1]}, cpu_util={psutil.cpu_percent(interval=0.5,percpu=True)[i]},cpu_count={i} {timestamp}")

def print_memory(timestamp):
    return print(f"memory, system={platform.uname()[0]},host={platform.uname()[1]}, memory_util={psutil.virtual_memory()[2]},memory_used={round(psutil.virtual_memory()[3]/(1024**3),1)},memory_free={round(psutil.virtual_memory()[4]/(1024**3), 1)} {timestamp}")

if args.target.lower() == "cpu":
    print_cpu(timestamp)
elif args.target.lower() == "memory":
    print_memory(timestamp)