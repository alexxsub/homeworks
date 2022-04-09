import datetime


def to_flp(measurement: str, data: dict, tags=None) -> str:
    if not measurement or not data:
        raise ValueError("Measurement and data must be specified")

    if tags is None or not isinstance(tags, dict):
        tags = {}

    tag_line = ''
    item_line = ''

    for key, value in data.items():
        item_line += f"{key}={value}"

    for key, value in tags.items():
        tag_line += f"{key}={value}"

    if tag_line:
        tag_line = f"{tag_line} "

    time_stamp = int(datetime.datetime.now().timestamp() * 1000000)

    return f"{measurement} {tag_line}{item_line} {time_stamp}"
