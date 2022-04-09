from influxdb import InfluxDBClient 
import socket
import psutil
import time

INFLUX_DB = 'mydb'
INFLUX_HOST = 'influxdb'

def metrics(perf,func_value):
    data = []
    data.append("{measurement},host={host} used_percent={util}"
                .format(measurement=perf,
            host=socket.gethostname(),
                        util=func_value))
    return data

if __name__ == '__main__':
    client = InfluxDBClient(INFLUX_HOST)

    list_db = client.get_list_database()

# Check present INFLUX_DB
    k = 0
    for db in list_db:
        if INFLUX_DB in db.values():
            k=k+1
   
    if k == 0:
        client.create_database(INFLUX_DB)

    while True:
        vmp = psutil.virtual_memory().percent
        cu = psutil.cpu_percent()
        cpu_usage = metrics('cpu_util',cu) 
        mem_usage = metrics('mem_use', vmp)
        print('cpu_usage',cpu_usage)
        client.write(cpu_usage,{'db':INFLUX_DB},204,'line') 
        print('mem_usage',mem_usage)
        client.write(mem_usage,{'db':INFLUX_DB},204,'line') 
        time.sleep(2)
