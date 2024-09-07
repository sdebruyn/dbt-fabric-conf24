with src as (
    select *
    from {{ source('shopping_system', 'supplies') }}
),

renamed as (
    select
        id as supply_id,
        name as supply_name,
        cost as supply_cost,
        perishable,
        sku
    from src
),

final as (
    select
        {{ dbt_utils.generate_surrogate_key(['supply_id', 'sku']) }} as supply_uuid,
        supply_id,
        supply_name,
        {{ cents_to_dollars("supply_cost") }} as supply_cost,
        case
            when perishable = 'True' then 1
            else 0
        end as perishable,
        sku
    from renamed
)

select *
from final