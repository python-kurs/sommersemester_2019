#! /usr/bin/python
# -*- coding: utf-8 -*-

#get header from jupyter notebook
import nbformat
from nbconvert import MarkdownExporter

with open("content/motivation.ipynb", "r") as f:
    raw = f.read()

notebook = nbformat.reads(raw, as_version=4)
#access cells
notebook.cells[0]

#convert
md_exporter = MarkdownExporter()
md = md_exporter.from_notebook_node(notebook)
#then md can be used with the below code


import markdown

md = markdown.Markdown(extensions=["toc"])

with open("content/units/units.md", "r") as f:
    md.convert(f.read())

md.toc_tokens


