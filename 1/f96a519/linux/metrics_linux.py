import os
import time
host = str(os.popen('hostname').readline().strip())
try:
    for i in range(30):
        um = int(os.popen('free -m').readlines()[1].split()[2])
        gcpu= str (os.popen('uptime').readline().strip().split()[9])
        ts = time.time()
        print('cpu&ram,'+' host='+host,'cpu_usage_percent='+gcpu[0]+' RAM_usage_Mbytes='+str(um*1024), \
              str(ts).replace('.','').ljust(19,'0'))
        time.sleep(2)
except:
        i-=1
        pass