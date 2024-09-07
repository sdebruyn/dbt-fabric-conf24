{% macro cents_to_dollars(column_name, precision=2) %}
    cast({{ column_name }} as decimal(12, {{ precision }})) / 100
{% endmacro %}