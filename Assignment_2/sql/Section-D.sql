-- Q19. Display each order along with the
-- customer's first_name and last_name.
-- =========================================

SELECT o.order_id,
o.order_date,
c.first_name,
c.last_name,
o.total_amount
FROM orders o
INNER JOIN customers c
ON o.customer_id = c.customer_id;
-- =========================================
-- Q20. Using a LEFT JOIN, list ALL customers
-- and their orders (if any).
-- =========================================

SELECT c.customer_id,
c.first_name,
c.last_name,
o.order_id,
o.order_date
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id;
-- =========================================
-- Q21. Show order details using joins across
-- orders, order_items and products.
-- =========================================

SELECT o.order_id,
p.product_name,
oi.quantity,
oi.unit_price,
oi.discount_pct
FROM orders o
JOIN order_items oi
ON o.order_id = oi.order_id
JOIN products p
ON oi.product_id = p.product_id;
-- =========================================
-- Q22. Difference between LEFT JOIN and
-- RIGHT JOIN. When would FULL OUTER JOIN
-- be used?
-- =========================================

LEFT JOIN Example:

SELECT *
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id;
-- =========================================
-- Q23. Identify all Foreign Key relationships
-- in the schema.
-- =========================================
