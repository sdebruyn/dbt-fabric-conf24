with

source as (

    select * from {{ source('ecom', 'raw_stores') }}

),

casted as (
    select
        *,
        cast(opened_at as datetime2(6)) as opened_at_date
    from source
),

renamed as (

    select

        ----------  ids
        id as location_id,

        ---------- text
        name as location_name,

        ---------- numerics
        tax_rate,

        ---------- timestamps
        {{ dbt.date_trunc('day', 'opened_at_date') }} as opened_date

    from casted

)

select * from renamed
