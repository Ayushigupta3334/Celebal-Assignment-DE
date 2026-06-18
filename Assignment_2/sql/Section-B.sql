-- Q7. Retrieve all orders with status = 'Delivered'.
-- =========================================

SELECT *
FROM orders
WHERE status = 'Delivered';
-- =========================================
-- Q8. Find all products in the 'Electronics'
-- category with a unit_price greater than ₹2000.
-- =========================================

SELECT *
FROM products
WHERE category = 'Electronics'
AND unit_price > 2000;
-- =========================================
-- Q9. List all customers who joined in 2024
-- and belong to the state 'Maharashtra'.
-- =========================================

SELECT *
FROM customers
WHERE state = 'Maharashtra'
AND join_date BETWEEN '2024-01-01' AND '2024-12-31';
 -- =========================================
-- Q10. Find all orders placed between
-- '2024-08-10' and '2024-08-25' (inclusive)
-- that are NOT cancelled.
-- =========================================

SELECT *
FROM orders
WHERE order_date BETWEEN '2024-08-10' AND '2024-08-25'
AND status <> 'Cancelled';
-- =========================================
-- Q11. Explain what the index idx_orders_date does.
-- =========================================

Index Definition:

CREATE INDEX idx_orders_date
ON orders(order_date);

-- =========================================
-- Q12. Would the index be used for:
-- SELECT * FROM customers
-- WHERE YEAR(join_date) = 2024;
-- =========================================

Query:

SELECT *
FROM customers
WHERE EXTRACT(YEAR FROM join_date) = 2024;
