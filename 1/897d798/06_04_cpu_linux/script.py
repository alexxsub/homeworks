#!/usr/bin/env python

import socket
import time

import psutil

MEASUREMENT_NAME = "CPU"


def _get_total_cpu_usage():
    total_cpu_usage = psutil.cpu_percent(interval=1, percpu=False)
    return total_cpu_usage


def _get_percore_cpu_usage():
    percore_cpu_usage = {}
    for i, cpu in enumerate(psutil.cpu_percent(interval=1, percpu=True)):
        percore_cpu_usage[i] = cpu
    return percore_cpu_usage


def _get_tags():
    tags_data = [
        ("hostname", socket.gethostname())
    ]
    tags = ",".join("=".join(item) for item in tags_data)
    return tags


def _get_metrics():
    metrics_data = [
        ("total", str(_get_total_cpu_usage())),
    ]

    percore_cpu_usage = _get_percore_cpu_usage()
    for core_i, core_usage in percore_cpu_usage.items():
        metrics_data.append((f"core{core_i}", str(core_usage)))

    metrics = ",".join("=".join(item) for item in metrics_data)
    return metrics


def _get_output():
    tags = _get_tags()
    metrics = _get_metrics()
    timestamp = int(time.time())

    output = f"{MEASUREMENT_NAME},{tags} {metrics} {timestamp}"
    return output


if __name__ == "__main__":
    output = _get_output()
    print(output)
