FROM alpine:3.10.1
LABEL maintainer="denergym@mail.ru"

RUN apk add --update gcc libc-dev fortify-headers linux-headers py-psutil && rm -rf /var/cache/apk/*


RUN apk add --no-cache python3 && \
    if [ ! -e /usr/bin/python ]; then ln -sf python3 /usr/bin/python ; fi && \
    python3 -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip3 install --no-cache --upgrade pip setuptools influxdb influxdb-client
COPY perf_mon.py /usr/local/bin
ENTRYPOINT ["python3", "-u", "/usr/local/bin/perf_mon.py"]
