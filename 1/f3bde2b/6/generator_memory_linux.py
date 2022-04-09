import psutil
import time
from queue import Queue

tasks = Queue()

def get_memory_data(host='localhost', contur='test'):
    '''
    Генератор состояния памяти для ОС Linux в формате InfluxDB line

    host: Указывает имя хоста
    contur:Название контура
    '''
    while True:
        mem_stat = psutil.virtual_memory()
        yield f'memory host={host},contur={contur} total={mem_stat.total},available={mem_stat.available},' \
              f'percent={mem_stat.percent},used={mem_stat.used},free={mem_stat.free} {time.time()}'

def event_loop(sleep_time=5):
    '''
    Цикл событий для управления генераторами

    sleep_time: Интервал обращения к генератору
    '''
    while True:
        task = tasks.get()

        influx_line = next(task)
        print(influx_line)

        time.sleep(sleep_time)
        tasks.put(task)

if __name__ == '__main__':
    tasks.put(get_memory_data())
    event_loop()