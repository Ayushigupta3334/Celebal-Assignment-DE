-- =====================================================
-- Query 1: Rank Customers by Lifetime Value
-- =====================================================

WITH customer_revenue AS
(
    SELECT
        c.customer_id,
        c.customer_name,
        ROUND(
            SUM(
                oi.quantity *
                oi.unit_price *
                (1 - oi.discount_percent / 100.0)
            ),
            2
        ) AS lifetime_value
    FROM customers c
    JOIN orders o
        ON c.customer_id = o.customer_id
    JOIN order_items oi
        ON o.order_id = oi.order_id
    GROUP BY
        c.customer_id,
        c.customer_name
)

SELECT *,
       DENSE_RANK() OVER (
           ORDER BY lifetime_value DESC
       ) AS customer_rank
FROM customer_revenue
LIMIT 20;

-- =====================================================
-- Query 2: Running Revenue by Month
-- =====================================================

WITH monthly_revenue AS
(
    SELECT
        strftime('%Y-%m', o.order_date) AS month,
        ROUND(
            SUM(
                oi.quantity *
                oi.unit_price *
                (1 - oi.discount_percent / 100.0)
            ),
            2
        ) AS revenue
    FROM orders o
    JOIN order_items oi
        ON o.order_id = oi.order_id
    GROUP BY month
)

SELECT
    month,
    revenue,
    SUM(revenue) OVER (
        ORDER BY month
    ) AS running_total
FROM monthly_revenue;

-- =====================================================
-- Query 3: 3-Month Moving Average Revenue
-- =====================================================

WITH monthly_revenue AS
(
    SELECT
        strftime('%Y-%m', o.order_date) AS month,
        ROUND(
            SUM(
                oi.quantity *
                oi.unit_price *
                (1 - oi.discount_percent / 100.0)
            ),
            2
        ) AS revenue
    FROM orders o
    JOIN order_items oi
        ON o.order_id = oi.order_id
    GROUP BY month
)

SELECT
    month,
    revenue,
    ROUND(
        AVG(revenue) OVER (
            ORDER BY month
            ROWS BETWEEN 2 PRECEDING
            AND CURRENT ROW
        ),
        2
    ) AS moving_average
FROM monthly_revenue;

-- =====================================================
-- Query 4: Monthly Revenue Growth Using LAG()
-- =====================================================

WITH monthly_revenue AS
(
    SELECT
        strftime('%Y-%m', o.order_date) AS month,
        ROUND(
            SUM(
                oi.quantity *
                oi.unit_price *
                (1 - oi.discount_percent / 100.0)
            ),
            2
        ) AS revenue
    FROM orders o
    JOIN order_items oi
        ON o.order_id = oi.order_id
    GROUP BY month
)

SELECT
    month,
    revenue,
    revenue -
    LAG(revenue) OVER (
        ORDER BY month
    ) AS growth
FROM monthly_revenue;

-- =====================================================
-- Query 5: Customer Order Sequence
-- =====================================================

SELECT
    customer_id,
    order_id,
    order_date,
    ROW_NUMBER() OVER (
        PARTITION BY customer_id
        ORDER BY order_date
    ) AS order_number
FROM orders
LIMIT 30;