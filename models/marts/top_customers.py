def model(dbt, session):

    customers_df = dbt.ref("customers")
    top_customers = customers_df.orderBy("lifetime_spend_pretax", ascending=False)
    final_df = top_customers.limit(10)

    return final_df