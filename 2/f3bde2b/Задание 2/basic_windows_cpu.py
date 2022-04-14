import psutil
import time

def get_cpu_data():
    '''
    Считывает актуальные данные о состоянии процессора для ОС Windows и выводит в формате InfluxDB line
    '''
    percent = psutil.cpu_percent(1)
    freq = psutil.cpu_freq().current
    print(f'cpu busy_percent={percent} {time.time_ns()}')

if __name__ == '__main__':
    get_cpu_data()