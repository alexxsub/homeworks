from influx_line_protocol import Metric
import psutil
import platform
from time import time_ns

metric = Metric("cpu")
metric.with_timestamp(time_ns())
metric.add_tag('host', platform.node())
metric.add_value('cpu_percent', psutil.cpu_percent(0.1))

print(metric)
