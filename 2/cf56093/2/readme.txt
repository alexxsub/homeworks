Были взяты скрипты из предыдущего дз:
cpu_usage_fluxline.py
mem_usage_fluxline.sh

оба не заработали сразу, потомучто имели неправельный формат fluxline.

Cогласно документации https://docs.influxdata.com/influxdb/v1.8/write_protocols/line_protocol_tutorial/#whitespace-i если передается только одна метрика - после её названия ставится пробел, а не запятая. Исправленные скрипты прилагаются.

