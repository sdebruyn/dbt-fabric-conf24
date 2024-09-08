{{
    config(
    materialized = 'incremental',
    unique_key = 'tweet_id',
    )
}}

with tweets as (
    select *
    from {{ ref('stg_tweets') }}

    {% if is_incremental() %}
        where tweeted_at >= (select coalesce(max(tweeted_at),'1900-01-01') from {{ this }} )
    {% endif %}
),

customers as (
    select *
    from {{ ref('stg_customers') }}
),

final as (
    select
        tweet_id,
        tweeted_at,
        customer_name,
        content
    from tweets

    left join customers
    on customers.customer_id = tweets.customer_id
)

select *
from final