import pandas as pd
import random
from faker import Faker

fake = Faker()
customers = []

for i in range(1, 501):

    email = fake.email()

    customers.append({
        "customer_id": i,
        "customer_name": fake.name(),
        "email": email,
        "registration_date": fake.date(),
        "customer_type": random.choice(
            ["REGULAR", "PREMIUM", "VIP"]
        )
    })

customers = pd.DataFrame(customers)
customers.head()
bad_rows = random.sample(range(500), 10)

for i in bad_rows:
    customers.loc[i, "email"] = "invalidemail.com"
duplicates = customers.sample(5)

customers = pd.concat(
    [customers, duplicates],
    ignore_index=True
)
customers.to_csv(
    "customers.csv",
    index=False
)
categories = [
    "Electronics",
    "Clothing",
    "Home",
    "Books"
]

products = []

for i in range(1, 501):

    products.append({
        "product_id": i,
        "product_name": fake.word(),
        "category": random.choice(categories),
        "subcategory": fake.word(),
        "cost_price": random.randint(100, 5000)
    })

products = pd.DataFrame(products)
products.head()
for i in random.sample(range(500), 20):

    name = products.loc[i, "product_name"]

    products.loc[i, "product_name"] = (
        "   " + name.upper() + "   "
    )
orders = []

statuses = [
    "PLACED",
    "SHIPPED",
    "DELIVERED",
    "CANCELLED",
    "RETURNED"
]

regions = [
    "NORTH",
    "SOUTH",
    "EAST",
    "WEST"
]

for i in range(1, 1001):

    orders.append({
        "order_id": i,
        "customer_id": random.randint(1, 500),
        "order_date": fake.date_time_between(
            start_date="-2y",
            end_date="now"
        ).strftime("%Y-%m-%d %H:%M:%S"),
        "status": random.choice(statuses),
        "region_code": random.choice(regions)
    })

orders = pd.DataFrame(orders)
orders.head()
null_rows = random.sample(range(1000), 50)

for i in null_rows:
    orders.loc[i, "customer_id"] = None
bad_dates = random.sample(range(1000), 30)

for i in bad_dates:

    d = fake.date()

    year, month, day = d.split("-")

    orders.loc[i, "order_date"] = (
        f"{day}-{month}-{year}"
    )
duplicates = orders.sample(10)

orders = pd.concat(
    [orders, duplicates],
    ignore_index=True
)
order_items = []

for i in range(1, 3001):

    order_items.append({
        "item_id": i,
        "order_id": random.randint(1, 1000),
        "product_id": random.randint(1, 500),
        "quantity": random.randint(1, 5),
        "unit_price": random.randint(100, 5000),
        "discount_percent": random.randint(0, 100)
    })

order_items = pd.DataFrame(order_items)
order_items.head()
order_items = []

negative_rows = random.sample(range(3000), 90)

for i in negative_rows:
    order_items.loc[i, "quantity"] = -random.randint(1, 5)
bad_rows = random.sample(range(3000), 50)

for i in bad_rows:
    order_items.loc[i, "order_id"] = random.randint(5000, 6000)
order_items[
    order_items["order_id"] > 1000
].head()