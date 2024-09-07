with 

source as (

    select * from {{ source('shopping_system', 'customers') }}

),

renamed as (

    select
        ID as customer_id,
        FIRST_NAME as first_name,
        LAST_NAME as last_name

    from source

)

select * from renamed
