Для работы необходим модуль для Python psutil 
pip install psutil 

Скрипт работает как на Windows так и на Linux 

Для запуска скрипта ему необходимо передать аргументы cpu или memory (-h для подсказки)

Примеры 
python.exe C:/Users/hakee/OneDrive/Документы/Homework/#4-7/HW_mon.py cpu
cpu, system=Windows,host=Aigiz, cpu_util=31.2,cpu_count=0 1649062383.580584
cpu, system=Windows,host=Aigiz, cpu_util=0.0,cpu_count=1 1649062383.580584
cpu, system=Windows,host=Aigiz, cpu_util=6.1,cpu_count=2 1649062383.580584
cpu, system=Windows,host=Aigiz, cpu_util=3.0,cpu_count=3 1649062383.580584
cpu, system=Windows,host=Aigiz, cpu_util=6.2,cpu_count=4 1649062383.580584
cpu, system=Windows,host=Aigiz, cpu_util=3.0,cpu_count=5 1649062383.580584
cpu, system=Windows,host=Aigiz, cpu_util=0.0,cpu_count=6 1649062383.580584
cpu, system=Windows,host=Aigiz, cpu_util=0.0,cpu_count=7 1649062383.580584

C:/Users/hakee/OneDrive/Документы/Homework/#4-7/HW_mon.py memory
memory, system=Windows,host=Aigiz, memory_util=84.8,memory_used=10817961984,memory_free=1935134720 1649062485.281171

Linux
python3 mon_HW.py cpu
cpu, system=Linux,host=Aigiz, cpu_util=0.0,cpu_count=0 1649062638.46597
cpu, system=Linux,host=Aigiz, cpu_util=0.0,cpu_count=1 1649062638.46597
cpu, system=Linux,host=Aigiz, cpu_util=0.0,cpu_count=2 1649062638.46597
cpu, system=Linux,host=Aigiz, cpu_util=0.0,cpu_count=3 1649062638.46597
cpu, system=Linux,host=Aigiz, cpu_util=0.0,cpu_count=4 1649062638.46597
cpu, system=Linux,host=Aigiz, cpu_util=0.0,cpu_count=5 1649062638.46597
cpu, system=Linux,host=Aigiz, cpu_util=0.0,cpu_count=6 1649062638.46597
cpu, system=Linux,host=Aigiz, cpu_util=0.0,cpu_count=7 1649062638.46597

python3 mon_HW.py memory
memory, system=Linux,host=Aigiz, memory_util=27.9,memory_used=1015439360,memory_free=1989902336 1649062674.436643