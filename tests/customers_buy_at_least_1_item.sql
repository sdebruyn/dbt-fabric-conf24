with orders_mart as (
    select * from {{ ref('mrt_orders') }}
),

final as (
    select order_id
    from orders_mart
    where count_items < 1
)

select * from final