import os
import time

def get_cpu_data(host='localhost', contur='test', sleep_time=5):
    '''
    Считывает актуальные данные о состоянии процессора для ОС Linux и выводит в формате InfluxDB line

    host: Указывает имя хоста
    contur:Название контура
    sleep_time: Интервал замера данных
    '''
    while True:
        loadavg = os.getloadavg()[0]
        cpu_count = os.cpu_count()
        print('cpu', f'host={host},contur={contur}', f'load_average={loadavg},cpu_count={cpu_count}', time.time())
        time.sleep(sleep_time)

if __name__ == '__main__':
    get_cpu_data()