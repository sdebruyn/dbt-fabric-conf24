{% macro run_setup() %}
    {% call statement("run_setup", fetch_result=None) %}
        
        drop table if exists dbo.customers;
        drop table if exists dbo.orders;
        drop table if exists dbo.payments;
        drop table if exists dbo.supplies;

        create table dbo.customers
        (
            [ID] [int],
            [FIRST_NAME] [varchar](8000),
            [LAST_NAME] [varchar](8000)
        );

        copy into [dbo].[customers]
        from 'https://dbtlabsynapsedatalake.blob.core.windows.net/dbt-quickstart-public/jaffle_shop_customers.parquet'
        with (
            file_type = 'parquet'
        );

        create table dbo.orders
        (
            [ID] [int],
            [USER_ID] [int],
            [ORDER_DATE] [date],
            [STATUS] [varchar](8000)
        );

        copy into [dbo].[orders]
        from 'https://dbtlabsynapsedatalake.blob.core.windows.net/dbt-quickstart-public/jaffle_shop_orders.parquet'
        with (
            file_type = 'parquet'
        );

        create table dbo.payments
        (
            [ID] [int],
            [ORDERID] [int],
            [PAYMENTMETHOD] [varchar](8000),
            [STATUS] [varchar](8000),
            [AMOUNT] [int],
            [CREATED] [date]
        );

        copy into [dbo].[payments]
        from 'https://dbtlabsynapsedatalake.blob.core.windows.net/dbt-quickstart-public/stripe_payments.parquet'
        with (
            file_type = 'parquet'
        );

        create table dbo.supplies
        (
            [id] [varchar](8000),
            [name] [varchar](8000),
            [cost] [int],
            [perishable] [varchar](8000),
            [sku] [varchar](8000)
        )

        copy into [dbo].[supplies]
        from 'https://sadbtsamdemos.blob.core.windows.net/public/raw_supplies.csv'
        with (
            file_type = 'csv',
            firstrow = 2
        );

    {% endcall %}
{% endmacro %}