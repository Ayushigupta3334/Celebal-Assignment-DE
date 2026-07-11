-- Total Revenue per Category
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
ORDER BY revenue DESC;

--------------------------------------------------

-- Top 10 Customers by Revenue
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
LIMIT 10;

--------------------------------------------------

-- Month-wise Order Count
SELECT
    strftime('%Y-%m', order_date) AS month,
    COUNT(*) AS total_orders
FROM orders
GROUP BY month
ORDER BY month;

-------------------------------------------------------------

--Customers Who Placed Orders But Never Had Any Item Delivered
pd.read_sql("""
SELECT DISTINCT
    c.customer_id,
    c.customer_name
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
WHERE c.customer_id NOT IN
(
    SELECT DISTINCT
        o.customer_id
    FROM orders o
    WHERE o.status = 'DELIVERED'
)
""", conn)

--------------------------------------------------

--Products Having More Returns Than Purchases
pd.read_sql("""
SELECT
    p.product_name,
    SUM(
        CASE
        WHEN oi.quantity < 0
        THEN ABS(oi.quantity)
        ELSE 0
        END
    ) AS returned,
    SUM(
        CASE
        WHEN oi.quantity > 0
        THEN oi.quantity
        ELSE 0
        END
    ) AS purchased
FROM order_items oi
JOIN products p
ON oi.product_id = p.product_id
GROUP BY
    p.product_id,
    p.product_name
HAVING returned > purchased
""", conn)

--------------------------------------------------

--Return Rate per Category
pd.read_sql("""
SELECT
    p.category,
    ROUND(
        100.0 *
        SUM(
            CASE
            WHEN oi.quantity < 0
            THEN ABS(oi.quantity)
            ELSE 0
            END
        )
        /
        SUM(ABS(oi.quantity)),
        2
    ) AS return_rate
FROM order_items oi
JOIN products p
ON oi.product_id = p.product_id
GROUP BY p.category
""", conn)