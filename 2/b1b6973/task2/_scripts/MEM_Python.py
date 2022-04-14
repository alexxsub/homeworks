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

def get_memory():
    ram = psutil.virtual_memory()
    field_keys = {
        'total': ram[0],
        'available': ram[1],
        'percent': ram[2],
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
        'host': '"Ubuntu1"'
    }

    flux['measurement'] = "Memory_Python"
    flux['field_keys'], flux['tstamp'] = get_memory()
    convert_to_flux_format(**flux)
    
    return None    

if __name__ == "__main__":
    main()