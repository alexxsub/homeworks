import psutil, time

def ram_usage():
    return 'ram_usage percent=' + str(int(psutil.virtual_memory()[2])) + ' ' + str((int(time.time())))

if __name__ == '__main__':
    print(ram_usage())
