import psutil
import time


def get_ram_usage():
    return (int(psutil.virtual_memory().total - psutil.virtual_memory().available))

mem_percent = round((get_ram_usage()/int(psutil.virtual_memory().total))*100,2)
print("memory,host=windows usage_percent=" + str(mem_percent) + ",usage_kbytes=" + str(round(get_ram_usage()/1024))  + " " + str(int(time.time())))
