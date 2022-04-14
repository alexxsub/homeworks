#!/usr/bin/python3

from cpu_load_generator import load_all_cores

# load_single_core(core_num=0, duration_s=20, target_load=1) 

if __name__ == "__main__":
    load_all_cores(duration_s=230, target_load=0.80)