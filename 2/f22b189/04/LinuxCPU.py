import time

with open("/proc/stat") as procfile:
    cpustats = procfile.readline().split()
    user = int(cpustats[1])
    nice = int(cpustats[2])
    system = int(cpustats[3])
    idle = int(cpustats[4])
    iowait = int(cpustats[5])
    tot_load = user + nice + system
    tot_idle = idle + iowait

time.sleep(0.5)

with open("/proc/stat") as procfile:
    cpustats = procfile.readline().split()
    user_ = int(cpustats[1])
    nice_ = int(cpustats[2])
    system_ = int(cpustats[3])
    idle_ = int(cpustats[4])
    iowait_ = int(cpustats[5])
    tot_load_ = user_ + nice_ + system_
    tot_idle_ = idle_ + iowait_

diff_load = tot_load_ - tot_load
diff_idle = tot_idle_ - tot_idle

cpu = 100.0 * diff_load/ (diff_load + diff_idle)

fluxline =  'cpu_proc,cpu=proc_cpu cpu-proc='+str(round(cpu, 2))
print(fluxline)