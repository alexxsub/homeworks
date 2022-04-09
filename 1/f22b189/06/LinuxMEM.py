import psutil
def get_mem():
    mem_util = psutil.virtual_memory()[2]
    fluxline =  'Metrics,tag1=mem fieldKey="MemUtil" '+str(mem_util)
    return fluxline

if __name__ == "__main__":
    print(get_mem())
