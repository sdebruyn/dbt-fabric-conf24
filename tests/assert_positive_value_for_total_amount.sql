select
    order_id,
    sum(amount) as total_amount
from {{ ref('stg_payments') }}
group by order_id
having not(sum(amount) >= 0)