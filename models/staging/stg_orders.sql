with 

source as (

    select * from {{ source('shopping_system', 'orders') }}

),

renamed as (

    select
        ID as order_id,
        USER_ID as customer_id,
        ORDER_DATE as order_date,
        STATUS as order_status

    from source

)

select * from renamed
