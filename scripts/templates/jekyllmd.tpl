{% extends 'markdown.tpl' %}

<!-- Add class for input area -->
{% block input %}
{% if cell.source != '' %}
{:.input_area{% if 'hidecode' in cell.metadata.tags %} .hidecode{% endif %}}
```
{%- if 'magics_language' in cell.metadata  -%}
    {{ cell.metadata.magics_language}}
{%- elif 'name' in nb.metadata.get('language_info', {}) -%}
    {{ nb.metadata.language_info.name }}
{%- endif %}
{{ cell.source }}
```
{% endif %}
{% endblock input %}

<!-- code to color cells with warnings or info tags -->
<!-- source: https://nbconvert.readthedocs.io/en/latest/customizing.html --> 
{% block markdowncell scoped %}
{% if cell['metadata'].get('tags', []) != '' %}
{::options parse_block_html="true" /}
{% if 'remove_cell' not in cell['metadata'].get('tags', []) %}
{% if 'warning' in cell['metadata'].get('tags', []) %}
<div class="alert warning">
{{ super() }}
</div>
{% elif 'info' in cell['metadata'].get('tags', []) %}
<div class="alert info">
{{ super() }}
</div>
{% elif 'danger' in cell['metadata'].get('tags', []) %}
<div class="alert danger">
{{ super() }}
</div>
{% elif 'task' in cell['metadata'].get('tags', []) %}
<div class="alert task">
{{ super() }}
</div>
{% elif 'solution' in cell['metadata'].get('tags', []) %}
<div class="alert solution">
{{ super() }}
</div>
{% else %}
    {{ super() }}
{% endif %}
{% endif %}
{::options parse_block_html="true" /}
{% endif %}
{% endblock markdowncell %}

<!-- Remove indentations for output text  -->
{% block stream %}
{:.output .output_stream}
```
{{ output.text }}
```
{% endblock stream %}


{% block data_text %}
{:.output .output_data_text}
```
{{ output.data['text/plain'] }}
```
{% endblock data_text %}


{% block error  %}
{:.output .output_traceback_line}
```
{{- super() }}
```
{% endblock error  %}

{% block data_html %}
<div markdown="0" class="output output_html">
{{ output.data['text/html'] }}
</div>
{% endblock data_html %}

{% block data_png %}
{:.output .output_png}
{{- super() }}
{% endblock data_png %}
