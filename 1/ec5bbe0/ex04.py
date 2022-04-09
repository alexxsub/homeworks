import psutil, time

def cpu_usage():
    return 'cpu_usage percent=' + str(int(psutil.cpu_percent(interval=0.1))) + ' ' + str((int(time.time())))

if __name__ == '__main__':
    print(cpu_usage())
