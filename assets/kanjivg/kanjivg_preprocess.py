from concurrent.futures import ThreadPoolExecutor
import sys
import re

MAX_WORKERS = 400

pattern = re.compile(r"id.*?type.*? ")


def process_file(filename: str):
    print(filename)

    with open(filename, encoding="utf-8", newline="") as f:
        lines = f.readlines()

    lines = list(filter(lambda line: "<path" in line, lines))
    lines = [pattern.sub("", line.strip()) for line in lines]
    output = "<svg>" + "".join(lines) + "</svg>"

    with open(filename, "w", encoding="utf-8", newline="") as f:
        f.write(output)


filenames = sys.argv[1:]

with ThreadPoolExecutor(max_workers=MAX_WORKERS) as executor:
    executor.map(process_file, filenames)
