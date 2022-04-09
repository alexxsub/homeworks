import socket
import time

import psutil


def main() -> str:
    mem_usage = psutil.virtual_memory().percent
    unix_time = time.time_ns()
    host_name = socket.gethostname()
    return f"mem_usage,host={host_name} usage_percent={mem_usage} {unix_time}"


if __name__ == "__main__":
    print(main())
