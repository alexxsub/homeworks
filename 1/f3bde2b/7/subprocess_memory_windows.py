import subprocess
import re
import time
pattern = re.compile(r'\d+')

def get_os_cpu_data(host='localhost', contur='test', sleep_time=5):
    '''
    С помощью обращения к консольным командам ОС Windows получает данные о процессоре

    host: Указывает имя хоста
    contur:Название контура
    sleep_time: Интервал замера данных
    '''

    while True:
        sub_tasks = []
        sub_tasks.append(subprocess.check_output('wmic memorychip get capacity'))
        sub_tasks.append(subprocess.check_output('wmic memorychip get Speed'))
        sub_tasks.append(subprocess.check_output('wmic memorychip get SerialNumber'))

        capacity, speed, serial = [re.findall(pattern, line.decode())[0] for line in sub_tasks]

        print('memory', f'host={host},contur={contur},serialnumber={serial}',
              f'capacity={capacity},speed={speed}', time.time())
        time.sleep(sleep_time)

if __name__ == '__main__':
    get_os_cpu_data()