import sqlite3
import pandas as pd
import argparse

conn = sqlite3.connect("ecommerce.db")

parser = argparse.ArgumentParser(
    description="E-commerce Analytics Reports"
)

parser.add_argument(
    "--report",
    type=str,
    required=True,
    help="revenue, top_customers, retention"
)

args = parser.parse_args()

if args.report == "revenue":

    query = """
    SELECT
        p.category,
        ROUND(
            SUM(
                oi.quantity *
                oi.unit_price *
                (1 - oi.discount_percent/100.0)
            ),
            2
        ) AS revenue
    FROM order_items oi
    JOIN products p
    ON oi.product_id = p.product_id
    GROUP BY p.category
    ORDER BY revenue DESC
    """

    print(pd.read_sql(query, conn))

elif args.report == "top_customers":

    query = """
    SELECT
        c.customer_id,
        c.customer_name,
        ROUND(
            SUM(
                oi.quantity *
                oi.unit_price *
                (1 - oi.discount_percent/100.0)
            ),
            2
        ) AS total_revenue
    FROM customers c
    JOIN orders o
    ON c.customer_id = o.customer_id
    JOIN order_items oi
    ON o.order_id = oi.order_id
    GROUP BY
        c.customer_id,
        c.customer_name
    ORDER BY total_revenue DESC
    LIMIT 10
    """

    print(pd.read_sql(query, conn))

elif args.report == "retention":

    query = """
    WITH first_purchase AS
    (
        SELECT
            customer_id,
            MIN(strftime('%Y-%m', order_date))
            AS cohort_month
        FROM orders
        GROUP BY customer_id
    )

    SELECT
        fp.cohort_month,
        strftime('%Y-%m', o.order_date)
        AS order_month,
        COUNT(DISTINCT o.customer_id)
        AS active_customers
    FROM orders o
    JOIN first_purchase fp
    ON o.customer_id = fp.customer_id
    GROUP BY
        fp.cohort_month,
        order_month
    ORDER BY
        fp.cohort_month,
        order_month
    """

    print(pd.read_sql(query, conn))

else:
    print(
        "Invalid report name.\n"
        "Available reports:\n"
        "1. revenue\n"
        "2. top_customers\n"
        "3. retention"
    )

conn.close()