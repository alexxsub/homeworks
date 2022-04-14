import psutil
import time

def get_memory_data():
    '''
    Считывает актуальные данные о состоянии памяти для ОС Windows и выводит в формате InfluxDB line
    '''
    mem_stat = psutil.virtual_memory()
    mem_perc = (mem_stat.free / mem_stat.total) * 100
    print(f'memory free_perc={round(mem_perc, 2)} {time.time_ns()}')

if __name__ == '__main__':
    get_memory_data()