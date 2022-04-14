#!/bin/bash
cat /dev/random | pigz -p2 -9 > /dev/null
