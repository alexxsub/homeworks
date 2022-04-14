Под Mac OS спользовал для измерения CPU:
-telegraf плагин
-puthon psutil script
-bash top/cpu_idle script

Итог:
telegraf plugin показал наиболее точный результат(судя по внутренней утилите Activity monitor)
psutil менее точный
top/cpu_idle еще менее точный
вероятнее всего в linux based через /proc/stat результат был бы точнее, но в mac os иная архитектура
разберу как время будет.
