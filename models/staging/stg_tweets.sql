with src as (
    select *
    from {{ source('ecom', 'raw_tweets') }}
),

renamed as (
    select
        id as tweet_id,
        user_id as customer_id,
        tweeted_at,
        content
    from src
)

select *
from renamed