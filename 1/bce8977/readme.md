# Домашнее задание "Мониторинг #1" #

Для получения значений метрик хоста используется пакет "psutil", позволяющий получить метрики независимо от ОС.

## Выполнение (Linux) ##
```shell
python3 -m venv venv && source venv/bin/activate && pip install -r requirements.txt && python ./cpu_load.py && python ./ram_utilization.py && deactivate
```

## Выполнение (Windows (Power Shell)) ##
```shell
python3 -m venv venv ; ./venv/bin/activate.ps1 ; pip install -r requirements.txt ; python ./cpu_load.py ; python ./ram_utilization.py ; deactivate
```