with tweets as (
    select *
    from {{ ref('stg_tweets') }}
),

dates as (
    select *
    from {{ ref('date_dimension') }}
),

joined as (
    select *
    from tweets

    left join dates
    on {{ date_trunc("day", "tweets.tweeted_at") }} = {{ date_trunc("day", "dates.date_day") }}
),

final as (
    select
        count(tweet_id) as count,
        max(tweeted_at) as most_recent,
        day_of_week_name
    from joined
    group by day_of_week_name
)

select *
from final