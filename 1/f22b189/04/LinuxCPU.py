import psutil
def get_cpu():
    cpu_util = psutil.cpu_percent(interval=0.5)
    fluxline = 	'Metrics,tag1=cpu fieldKey="CpuUtil" '+str(cpu_util)
    return fluxline

if __name__ == "__main__":
    print(get_cpu())
