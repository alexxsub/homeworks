from os import major
import psutil
import time
import socket
import argparse
import sys

if sys.version_info <= (3, 0):
    raise Exception("Python version %s is not supported. Run on python 3 versions." % (sys.version_info.major))

if sys.version_info >= (3, 7):
    _TIMESTAMP = time.time_ns()
else:
    _TIMESTAMP = int(round(time.time() * 1000000000))

_HOSTNAME = socket.gethostname()

def get_cpu():
    return "cpu,host=%s,contur=home cpu_busy_percent=%s %s" % (_HOSTNAME, psutil.cpu_percent(), _TIMESTAMP)

def get_memory():
    _memory = dict(psutil.virtual_memory()._asdict())
    return "memory,host=%s,contur=home mem_busy_percent=%s %s" % (_HOSTNAME, _memory["percent"], _TIMESTAMP)


def main(args):
    if args.cpu and args.mem:
        raise Exception("Ask only one value.")
    elif not args.cpu and not args.mem:
        raise Exception("Nothing was requested.")
    elif args.cpu:
        print(get_cpu())
    elif args.mem:
        print(get_memory())
        
        
if __name__ == '__main__':
    parser = argparse.ArgumentParser(description="Скрипт получения процента занятого cpu и памяти. Работает только на python версии 3")
    parser.add_argument('--cpu', action='store_true', default=False, help='get cpu busy in percent')
    parser.add_argument('--mem', action='store_true', default=False, help='get memory busy in percent')
    main(parser.parse_args())