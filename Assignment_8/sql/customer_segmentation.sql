-- =====================================================
-- Query 1: Purchase Frequency Segmentation
-- =====================================================

WITH customer_orders AS
(
    SELECT
        customer_id,
        COUNT(*) AS total_orders
    FROM orders
    GROUP BY customer_id
)

SELECT
    customer_id,
    total_orders,
    CASE
        WHEN total_orders = 1
            THEN 'One-Time'
        WHEN total_orders BETWEEN 2 AND 5
            THEN 'Occasional'
        ELSE 'Loyal'
    END AS frequency_segment
FROM customer_orders
ORDER BY total_orders DESC;

-- =====================================================
-- Query 2: Spend Tier Segmentation
-- =====================================================

WITH customer_revenue AS
(
    SELECT
        c.customer_id,
        ROUND(
            SUM(
                oi.quantity *
                oi.unit_price *
                (1 - oi.discount_percent / 100.0)
            ),
            2
        ) AS total_spent
    FROM customers c
    JOIN orders o
        ON c.customer_id = o.customer_id
    JOIN order_items oi
        ON o.order_id = oi.order_id
    GROUP BY c.customer_id
)

SELECT
    customer_id,
    total_spent,
    CASE
        WHEN total_spent < 5000
            THEN 'Low'
        WHEN total_spent BETWEEN 5000 AND 20000
            THEN 'Medium'
        ELSE 'High'
    END AS spend_tier
FROM customer_revenue
ORDER BY total_spent DESC;

-- =====================================================
-- Query 3: RFM Analysis
-- =====================================================

WITH rfm AS
(
    SELECT
        c.customer_id,

        CAST(
            julianday('now')
            -
            julianday(MAX(o.order_date))
            AS INTEGER
        ) AS recency,

        COUNT(DISTINCT o.order_id)
            AS frequency,

        ROUND(
            SUM(
                oi.quantity *
                oi.unit_price *
                (1 - oi.discount_percent / 100.0)
            ),
            2
        ) AS monetary

    FROM customers c
    JOIN orders o
        ON c.customer_id = o.customer_id
    JOIN order_items oi
        ON o.order_id = oi.order_id

    GROUP BY c.customer_id
)

SELECT
    *,
    CASE
        WHEN frequency >= 5
             AND monetary >= 20000
            THEN 'VIP'
        WHEN frequency >= 2
            THEN 'Regular'
        ELSE 'At Risk'
    END AS customer_segment
FROM rfm
ORDER BY monetary DESC;