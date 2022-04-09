import psutil
import time

def get_memory_data(host='localhost', contur='test', sleep_time=5):
    '''
    Считывает актуальные данные о состоянии памяти для ОС Windows и выводит в формате InfluxDB line

    host: Указывает имя хоста
    contur:Название контура
    sleep_time: Интервал замера данных
    '''
    while True:
        mem_stat = psutil.virtual_memory()
        print('phys_memory', f'host={host},contur={contur}', f'total={mem_stat.total},available={mem_stat.available},'
                                                     f'percent={mem_stat.percent},used={mem_stat.used},free={mem_stat.free}', time.time())
        time.sleep(sleep_time)

if __name__ == '__main__':
    get_memory_data()