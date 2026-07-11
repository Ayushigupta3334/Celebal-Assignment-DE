import pandas as pd
customers = pd.read_csv("customers.csv")
products = pd.read_csv("products.csv")
orders = pd.read_csv("orders.csv")
order_items = pd.read_csv("order_items.csv")

customers = customers.drop_duplicates()
invalid_emails = customers[
    ~customers["email"].str.contains(
        "@",
        na=False
    )
]
issues.append(
    ["customers",
     "Invalid Emails",
     len(invalid_emails)]
)
customers = customers[
    customers["email"].str.contains(
        "@",
        na=False
    )
]
orders["customer_id"].isnull().sum()
orders = orders.dropna(
    subset=["customer_id"]
)
issues.append(
    ["order_items",
     "Duplicate Rows",
     order_items.duplicated().sum()]
)

order_items = (
    order_items
    .drop_duplicates()
)
order_items = order_items[
    order_items["quantity"] > 0
]
orders = orders[
    orders["customer_id"].isin(customers["customer_id"])
]

order_items = order_items[
    order_items["order_id"].isin(orders["order_id"])
]

order_items = order_items[
    order_items["product_id"].isin(products["product_id"])
]
customers.to_csv(
    "customers_clean.csv",
    index=False
)

products.to_csv(
    "products_clean.csv",
    index=False
)

orders.to_csv(
    "orders_clean.csv",
    index=False
)

order_items.to_csv(
    "order_items_clean.csv",
    index=False
)