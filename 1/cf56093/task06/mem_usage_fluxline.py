import time
from psutil import virtual_memory

memory_info=virtual_memory();


print('mem_usage,totalmem='+str(memory_info[0])+',freemem='+str(memory_info[4])+',mem_usage_percent='+str(round((memory_info[0]-memory_info[4])/memory_info[0]*100))+' '+str(time.time_ns()));
