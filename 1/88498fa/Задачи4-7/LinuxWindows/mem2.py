from influx_line_protocol import Metric
import psutil
import platform
from time import time_ns

metric = Metric("memory")
metric.with_timestamp(time_ns())
metric.add_tag('host', platform.node())
metric.add_value('memory_used_gb', psutil.virtual_memory().used / (2**30))

print(metric)
