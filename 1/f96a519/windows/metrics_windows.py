import os
import time
host = str(os.popen('hostname').readline().strip())
for i in range(20):
    try:
        tot_m = int(os.popen('wmic ComputerSystem get TotalPhysicalMemory').readlines()[2])
        free_m = int(os.popen('wmic OS get FreePhysicalMemory').readlines()[2])
        cpu = int(os.popen('wmic cpu get loadpercentage').readlines()[2].split()[0])
        ts = time.time()
        res=[str(tot_m-(free_m*(10**(len(str(tot_m))-len(str(free_m))-1))))[:-3], str(cpu), str(ts).replace('.','').ljust(19,'0') ]
        print('cpu&ram,'+' host='+host,'cpu_usage_percent='+res[1]+' RAM_usage_Mbytes='+res[0],res[2])
        time.sleep(2)
    except:
        i-=1
        pass