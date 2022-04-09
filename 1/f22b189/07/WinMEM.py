import wmi
def get_mem():
    a = wmi.WMI()
    mem_avail = int([mem.AvailableMBytes for mem in a.Win32_PerfFormattedData_PerfOS_Memory()][0]) 
    mem_total = int([mem.TotalPhysicalMemory for mem in a.Win32_ComputerSystem()][0])/1048576
    mem_util = 100-(mem_avail*100)/mem_total
    fluxline = 'Metrics,tag1=mem fieldKey="MemUtil" '+str(round(mem_util, 1))
    return fluxline

if __name__ == "__main__":
    print(get_mem())
