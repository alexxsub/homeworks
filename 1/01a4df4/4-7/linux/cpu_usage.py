#!/usr/bin/env python
# -*- coding: utf-8 -*-

import time
import psutil

DOCUMENTATION = r'''
description: print cpu usage metric by flux line protocol
requirements:
    psutil==5.9.0
'''

EXAMPLES = r'''
cpu_usage percent=29.6 1648716627409526528
'''

print(f'cpu_usage percent={psutil.cpu_percent(interval=0.5)} {time.time_ns()}')
