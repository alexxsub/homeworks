import platform
from time import time_ns

errors_cnt = 0
try:
    with open("/home/baner/monitoring/telegraf/scripts/web_server/404.log") as f:
        errors_cnt = len(f.readlines())
except FileNotFoundError:
    pass

print(
    f"web_server404,host={platform.node()} 404_count={errors_cnt} {time_ns()}")
