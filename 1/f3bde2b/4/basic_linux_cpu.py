import psutil
import time

def get_cpu_data(host='localhost', contur='test', sleep_time=5):
    '''
    Считывает актуальные данные о состоянии процессора для ОС Linux и выводит в формате InfluxDB line

    host: Указывает имя хоста
    contur:Название контура
    sleep_time: Интервал замера данных
    '''
    while True:
        percent = psutil.cpu_percent(1)
        freq = psutil.cpu_freq().current
        print('cpu', f'host={host},contur={contur}', f'busy_percent={percent},current_freq={freq}', time.time())
        time.sleep(sleep_time)

if __name__ == '__main__':
    get_cpu_data()