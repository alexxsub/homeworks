#!/usr/bin/env python
# -*- coding: utf-8 -*-

import time
import psutil

DOCUMENTATION = r'''
description: print memory usage metric by flux line protocol
requirements:
    psutil==5.9.0
'''

EXAMPLES = r'''
mem_usage percent=30.0 1648716637366791704
'''

print(f'mem_usage percent={psutil.virtual_memory().percent} {time.time_ns()}')
