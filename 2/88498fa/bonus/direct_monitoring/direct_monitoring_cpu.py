from time import sleep
import influxdb_client
from influxdb_client.client.write_api import SYNCHRONOUS
import platform
import psutil

bucket = "python"
org = "dmitry"
token = "a5EZUfPGWtyFEIjbuZTyGC1CS-koEGfIBi-2d3YwouliSPwvSQFNO46lUGHkvbK-QAmtFXFedYghio7bk30S4g=="
host = platform.node()
url = "http://localhost:8086"

client = influxdb_client.InfluxDBClient(url=url, token=token, org=org)

write_api = client.write_api(write_options=SYNCHRONOUS)

if __name__ == "__main__":
    try:
        while True:
            p = (
                influxdb_client.Point("cpu")
                .tag("host", host)
                .tag("from", "direct_monitoring_py")
                .field("cpu_percent", psutil.cpu_percent(1))
            )
            write_api.write(bucket=bucket, org=org, record=p)
            sleep(10)
    except KeyboardInterrupt:
        exit()
