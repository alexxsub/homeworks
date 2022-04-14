#!/usr/bin/env python

import psutil
import socket
import datetime
import dateutil
from datetime import datetime, timedelta
from dateutil import tz, parser

hostname = socket.gethostname()
osystem = "Windows"

print('measurement_cpu_psutil,host={},os={} psutil_cpu_total={} {}'
      .format(hostname, osystem, int(psutil.cpu_percent(interval=1)),int(((datetime.utcnow() - dateutil.parser.parse('1/1/1970')).total_seconds() * 1000.0) * 1000000)))
