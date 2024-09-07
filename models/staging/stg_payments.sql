with 

source as (

    select * from {{ source('shopping_system', 'payments') }}

),

renamed as (

    select
        ID as payment_id,
        ORDERID as order_id,
        PAYMENTMETHOD as payment_method,
        STATUS as payment_status,
        {{ cents_to_dollars("AMOUNT") }} as amount,
        CREATED as payment_created

    from source

)

select * from renamed

