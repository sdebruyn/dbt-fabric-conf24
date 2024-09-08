{% snapshot orders_snapshot %}

{{
    config(
      unique_key='id',
      strategy='check',
      check_cols=["manager"]
    )
}}

select * from {{ ref("store_managers") }}

{% endsnapshot %}