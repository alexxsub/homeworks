import psutil
import time
print("cpu,host=windows usage_percent=" + str(psutil.cpu_percent(interval=1)) + " " + str(int(time.time())))
