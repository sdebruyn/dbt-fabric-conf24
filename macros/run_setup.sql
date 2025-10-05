{% macro run_setup() %}
    {% call statement("run_setup", fetch_result=None) %}
        
        if (schema_id('raw') is null) 
        begin
            exec ('create schema raw')
        end

        drop table if exists raw.customers;
        drop table if exists raw.items;
        drop table if exists raw.orders;
        drop table if exists raw.products;
        drop table if exists raw.stores;
        drop table if exists raw.supplies;
        drop table if exists raw.tweets;
        drop table if exists raw.tweets_preload;

        create table raw.customers
        (
            id varchar(max),
            name varchar(max)
        );

        create table raw.items
        (
            id varchar(max),
            order_id varchar(max),
            sku varchar(max)
        );

        create table raw.orders
        (
            id varchar(max),
            customer varchar(max),
            ordered_at varchar(max),
            store_id varchar(max),
            subtotal int,
            tax_paid int,
            order_total int
        );

        create table raw.products
        (
            sku varchar(max),
            name varchar(max),
            type varchar(max),
            price int,
            description varchar(max)
        );

        create table raw.stores
        (
            id varchar(max),
            name varchar(max),
            opened_at varchar(max),
            tax_rate decimal(18,4)
        );

        create table raw.supplies
        (
            id varchar(max),
            name varchar(max),
            cost int,
            perishable varchar(max),
            sku varchar(max)
        );

        create table raw.tweets
        (
            id varchar(max),
            user_id varchar(max),
            tweeted_at date,
            content varchar(max)
        );

        create table raw.tweets_preload
        (
            id varchar(max),
            user_id varchar(max),
            tweeted_at date,
            content varchar(max)
        );

        copy into raw.customers
        from 'https://sadbtsamdemos.blob.core.windows.net/public/raw_customers.csv'
        with (
            file_type = 'csv',
            firstrow = 2
        );

        copy into raw.items
        from 'https://sadbtsamdemos.blob.core.windows.net/public/raw_items.csv'
        with (
            file_type = 'csv',
            firstrow = 2
        );

        copy into raw.orders
        from 'https://sadbtsamdemos.blob.core.windows.net/public/raw_orders.csv'
        with (
            file_type = 'csv',
            firstrow = 2
        );

        copy into raw.products
        from 'https://sadbtsamdemos.blob.core.windows.net/public/raw_products.csv'
        with (
            file_type = 'csv',
            firstrow = 2
        );

        copy into raw.stores
        from 'https://sadbtsamdemos.blob.core.windows.net/public/raw_stores.csv'
        with (
            file_type = 'csv',
            firstrow = 2
        );

        copy into raw.supplies
        from 'https://sadbtsamdemos.blob.core.windows.net/public/raw_supplies.csv'
        with (
            file_type = 'csv',
            firstrow = 2
        );

        copy into raw.tweets_preload
        from 'https://sadbtsamdemos.blob.core.windows.net/public/raw_tweets.csv'
        with (
            file_type = 'csv',
            firstrow = 2
        );

    {% endcall %}
{% endmacro %}