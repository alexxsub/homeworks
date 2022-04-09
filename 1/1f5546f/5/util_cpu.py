import socket
import time

import psutil


def main() -> str:
    cpu_usage = psutil.cpu_percent(interval=0.5)
    unix_time = time.time_ns()
    host_name = socket.gethostname()
    return f"cpu_usage,host={host_name} usage_percent={cpu_usage} {unix_time}"


if __name__ == "__main__":
    print(main())
