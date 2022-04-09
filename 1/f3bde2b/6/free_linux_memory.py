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
        meminfo = re.findall(pattern, subprocess.check_output('free -t -m', shell=True).decode())
        total = meminfo[0]
        used = meminfo[1]
        free = meminfo[2]

        print('phys_memory', f'host={host},contur={contur}', f'total={total},used={used},'
                                                     f'free={free}', time.time())
        time.sleep(sleep_time)

if __name__ == '__main__':
    get_memory_data()