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
            id varchar(8000),
            name varchar(8000)
        );

        create table raw.items
        (
            sku varchar(8000),
            name varchar(8000),
            type varchar(8000),
            price int,
            description varchar(8000)
        );

        create table raw.orders
        (
            id varchar(8000),
            customer varchar(8000),
            ordered_at varchar(8000),
            store_id varchar(8000),
            subtotal int,
            tax_paid int,
            order_total int
        );

        create table raw.products
        (
            sku varchar(8000),
            name varchar(8000),
            type varchar(8000),
            price int,
            description varchar(8000)
        );

        create table raw.stores
        (
            id varchar(8000),
            name varchar(8000),
            opened_at varchar(8000),
            tax_rate decimal(18,4)
        );

        create table raw.supplies
        (
            id varchar(8000),
            name varchar(8000),
            cost int,
            perishable varchar(8000),
            sku varchar(8000)
        );

        create table raw.tweets
        (
            id varchar(8000),
            user_id varchar(8000),
            tweeted_at date,
            content varchar(8000)
        );

        create table raw.tweets_preload
        (
            id varchar(8000),
            user_id varchar(8000),
            tweeted_at date,
            content varchar(8000)
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