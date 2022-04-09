#!/bin/python3

import time
import psutil


if __name__ == '__main__':
    usage = psutil.cpu_percent(interval=1, percpu=False)

    timestamp = time.time_ns()

    print(f'cpu_usage percent={usage} {timestamp}')
