import wmi
def get_cpu():
    a = wmi.WMI()
    cpuArr = a.Win32_Processor()
    for cpu in cpuArr:
        fluxline = 'Metrics,tag1=cpu fieldKey="CpuUtil" '+str(cpu.loadPercentage)
    return fluxline

if __name__ == "__main__":
    print(get_cpu())
