import subprocess
import time
import re

pattern = re.compile(r'\d+')

def get_memory_data(host='localhost', contur='test', sleep_time=5):
    '''
    Считывает актуальные данные о состоянии памяти для ОС Linux и выводит в формате InfluxDB line

    host: Указывает имя хоста
    contur:Название контура
    sleep_time: Интервал замера данных
    '''
    while True:
        mem_data = []
        meminfo = subprocess.check_output('cat /proc/meminfo', shell=True).decode().split('\n')

        total, free, available = [re.findall(pattern, line)[0] for line in meminfo[:3]]

        print('phys_memory', f'host={host},contur={contur}', f'total={total},available={available},'
                                                     f'free={free}', time.time())
        time.sleep(sleep_time)

if __name__ == '__main__':
    get_memory_data()