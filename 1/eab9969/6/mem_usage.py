#!/bin/python3

import time
import psutil


if __name__ == '__main__':  
    usage = psutil.virtual_memory()[2]

    timestamp = time.time_ns()

    print(f'mem_usage percent={usage} {timestamp}')
