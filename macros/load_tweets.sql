{% macro load_tweets(until=2019) %}
    {% call statement("load_tweets", fetch_result=None) %}
        
        truncate table raw.tweets;
        insert into raw.tweets
        select * from raw.tweets_preload
        where tweeted_at < '{{ until }}-01-01';

    {% endcall %}
{% endmacro %}