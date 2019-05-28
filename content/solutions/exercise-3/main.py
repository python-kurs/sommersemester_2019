#! /usr/bin/python
# -*- coding: utf-8 -*-

from pathlib import Path
from utils import count_items

data_dir = Path("data")
output_dir = Path("solution")

# Construct path to text file
text_file = data_dir / "cars.txt"

# Read the file
with open(text_file, "r") as file:
    # .read() : read the whole file
    # .splitlines() : splits the lines and removes the lines break token "\n"
    # [1:] : remove the first line because "model" is the header of the file
    data = file.read().splitlines()[1:]

# Count items with imported function
counts = count_items(data)

# Check if output directory exists. If not create it.
if not output_dir.exists():
    output_dir.mkdir()

# Construct path to output file
out_file = output_dir / "counts.csv"

# Write results to file
with open(out_file, "w") as file:
    # Write header line
    file.write("model, count\n")
    # Write model and counts line by line
    for model, num in counts.items():
        file.write("{}, {}\n".format(model, num))
