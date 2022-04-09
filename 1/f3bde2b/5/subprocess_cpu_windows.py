import subprocess
import re
import time
pattern = re.compile(r'\d+')

def get_os_cpu_data(host='localhost', contur='test', sleep_time=5):
    '''
    С помощью обращения к консольным командам ОС Windows получает данные о памяти

    host: Указывает имя хоста
    contur:Название контура
    sleep_time: Интервал замера данных
    '''
    while True:
        sub_perc = subprocess.check_output('wmic cpu get LoadPercentage')
        sub_th = subprocess.check_output('wmic cpu get LoadPercentage')

        percent = re.findall(pattern, sub_perc.decode())[0]
        threads = re.findall(pattern, sub_th.decode())[0]

        print('cpu', f'host={host},contur={contur}', f'busy_percent={percent},threads_count={threads}', time.time())
        time.sleep(sleep_time)

if __name__ == '__main__':
    get_os_cpu_data()