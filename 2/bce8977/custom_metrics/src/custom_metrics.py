import psutil
import datetime

import influxdb_client
from influxdb_client.client.write_api import SYNCHRONOUS


def to_flp(measurement: str, data: dict, tags=None) -> str:
    if not measurement or not data:
        raise ValueError("Measurement and data must be specified")

    if tags is None or not isinstance(tags, dict):
        tags = {}

    tag_line = ''
    item_line = ''

    for key, value in data.items():
        item_line += f"{key}={value}"

    for key, value in tags.items():
        tag_line += f"{key}={value}"

    if tag_line:
        tag_line = f"{tag_line} "

    time_stamp = int(datetime.datetime.now().timestamp() * 1000000)

    return f"{measurement} {tag_line}{item_line} {time_stamp}"


client = influxdb_client.InfluxDBClient(
    url="http://127.0.0.1:8086",
    token="Ir254VuKytft8ucoIV2q2AUtTDB5H-akKSL6F1M6m5SEEjcrkQgwUCaTNpp-yqEGOSdN8ktQ9BOFUO9sNXS_kQ==",
    org="my-org",
)
write_api = client.write_api(write_options=SYNCHRONOUS)

while True:
    data = psutil.cpu_percent(interval=5, percpu=False)
    data_mem = psutil.virtual_memory()
    p = influxdb_client.Point("cpu_psutil").field("load", float(data))
    m = influxdb_client.Point("mem_psutil").field("load", float(data_mem.used))
    write_api.write(bucket="telegraf", org="my-org", record=p)
    write_api.write(bucket="telegraf", org="my-org", record=m)
    print('sended')
