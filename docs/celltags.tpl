{% extends 'full.tpl' %}

<!-- code to color cells with warnings or info tags -->
<!-- source: https://nbconvert.readthedocs.io/en/latest/customizing.html --> 
{% block any_cell %}
{% if 'warning' in cell['metadata'].get('tags', []) %}
    <div style="border:thin solid red">
        {{ super() }}
    </div>
{% elif 'info' in cell['metadata'].get('tags', []) %}
    <div style="border:thin solid orange">
        {{ super() }}
    </div>
{% elif 'task' in cell['metadata'].get('tags', []) %}
    <div style="border:thin solid green">
        {{ super() }}
    </div>
{% else %}
    {{ super() }}
{% endif %}
{% endblock any_cell %}
