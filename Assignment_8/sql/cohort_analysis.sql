-- Query 1: Customer Cohorts
WITH first_purchase AS
(
    SELECT
        customer_id,
        MIN(strftime('%Y-%m', order_date))
        AS cohort_month
    FROM orders
    GROUP BY customer_id
)
SELECT *
FROM first_purchase
ORDER BY cohort_month;

--------------------------------------------------

-- Query 2: Cohort Size
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
    cohort_month,
    COUNT(*) AS total_customers
FROM first_purchase
GROUP BY cohort_month
ORDER BY cohort_month;

--------------------------------------------------

-- Query 3: Monthly Retention
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
    order_month;

--------------------------------------------------

-- Query 4: Repeat vs One-Time Customers
WITH customer_orders AS
(
    SELECT
        customer_id,
        COUNT(*) AS total_orders
    FROM orders
    GROUP BY customer_id
)
SELECT
    CASE
        WHEN total_orders = 1
        THEN 'One-Time'
        ELSE 'Repeat'
    END AS customer_type,
    COUNT(*) AS customers
FROM customer_orders
GROUP BY customer_type;

--------------------------------------------------

-- Query 5: Churned Customers
SELECT
    customer_id,
    MAX(order_date)
        AS last_order_date
FROM orders
GROUP BY customer_id
HAVING julianday('now')
       -
       julianday(MAX(order_date))
       > 90;