import subprocess
import time

def get_cpu_data(host='localhost', contur='test', sleep_time=5):
    '''
    Считывает актуальные данные о состоянии процессора для ОС Linux и выводит в формате InfluxDB line

    host: Указывает имя хоста
    contur:Название контура
    sleep_time: Интервал замера данных
    '''
    while True:
        proc_line = subprocess.check_output('cat /proc/loadavg', shell=True).decode().split(' ')
        loadavg = proc_line[0]
        proc_count = proc_line[3].split('/')[0]
        print('cpu', f'host={host},contur={contur}', f'load_average={loadavg},proc_count={proc_count}', time.time())
        time.sleep(sleep_time)

if __name__ == '__main__':
    get_cpu_data()