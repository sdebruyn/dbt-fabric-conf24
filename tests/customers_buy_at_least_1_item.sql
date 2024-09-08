with orders_mart as (
    select * from {{ ref('orders') }}
),

final as (
    select order_id
    from orders_mart
    where count_order_items < 1
)

select * from final