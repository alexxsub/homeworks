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
    
    return "{0} {1} {2} {3}\n".format(
        measurement, 
        tags, 
        fields, 
        tstamp
    )

def get_cpu():
    field_keys = {
        'percent': psutil.cpu_percent()
    }
    
    return (
        field_keys, 
        int(time.time()*1000000000)
    )

def get_memory():
    ram = psutil.virtual_memory()
    field_keys = {
        'total': ram[0],
        'available': ram[1],
        'used': ram[3],
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
        'host': 'whatever'
    }
    
    measurements = {
        'CPU': get_cpu,
        'Memory': get_memory
    }
    
    for measurement, func in measurements.items():
        flux['measurement'] = measurement
        flux['field_keys'], flux['tstamp'] = func()
        convert_to_flux_format(**flux)
    
    return None    

if __name__ == "__main__":
    main()