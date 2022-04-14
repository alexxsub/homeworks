import time
import psutil

def flux_print(f):
    def wrap(*args, **kwargs):
        result = f(*args, **kwargs)
        print(result)
        
        return None
    return wrap    

@flux_print
def convert_to_flux_format(measurement='', tag_keys={}, field_keys={}, tstamp=''):
    tags = ",".join([f'{key}={value}' for key, value in tag_keys.items()])
    fields = ",".join([f'{key}={value}' for key, value in field_keys.items()])
    
    return "{0},{1} {2} {3}\n".format(
        measurement, 
        tags, 
        fields, 
        tstamp
    )

def get_cpu():
    field_keys = {
        'percent': psutil.cpu_percent(interval=1, percpu=True)
    }
    
    return (
        field_keys, 
        int(time.time()*1000000000)
    )

def main():
    
    flux = {
        'measurement': '',
        'tag_keys': {},
        'field_keys': {},
        'tstamp': None
    }

    flux['tag_keys'] = {
        'host': '"Ubuntu1"'
    }
    
    flux['measurement'] = "CPU_Python"
    flux['field_keys'], flux['tstamp'] = get_cpu()
    convert_to_flux_format(**flux)
    
    return None    

if __name__ == "__main__":
    main()