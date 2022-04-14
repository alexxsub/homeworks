import psutil
def get_mem():
    mem_total = psutil.virtual_memory()[0]
    mem_avail =  psutil.virtual_memory()[1]
    mem_util = (mem_total - mem_avail)*100/mem_total
    fluxline = 	'mem,mem=py_mem mem-python='+str(mem_util)
    return fluxline

if __name__ == "__main__":
    print(get_mem())
