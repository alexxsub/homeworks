import os
import time
try:
    host = str(os.popen('hostname').readline().strip())
    um = int(os.popen('free').readlines()[1].split()[2])
    gcpu= str(os.popen('uptime').readline().strip().split()[9])
    ts = time.time()
    print('cpu&ram,host='+host+' cpu_usage_percent='+gcpu[:-1]+',RAM_usage_Mbytes='+str(um), \
              str(ts).replace('.','').ljust(19,'0'))
except:
        pass

