-- Q24. Classify products into price tiers
-- using CASE.
-- =========================================

SELECT product_name,
unit_price,
CASE
WHEN unit_price < 1000 THEN 'Budget'
WHEN unit_price BETWEEN 1000 AND 3000 THEN 'Mid-Range'
ELSE 'Premium'
END AS price_tier
FROM products;
-- =========================================
-- Q25. Count Delivered vs Not Delivered
-- orders using CASE inside aggregate
-- functions.
-- =========================================

SELECT
SUM(CASE WHEN status = 'Delivered' THEN 1 ELSE 0 END) AS delivered_orders,
SUM(CASE WHEN status <> 'Delivered' THEN 1 ELSE 0 END) AS not_delivered_orders
FROM orders;

-- =========================================
-- Q26. Explain ACID Properties.
-- =========================================
-- =========================================
-- Q27. Write a SQL transaction that:
-- 1. Inserts a new order
-- 2. Inserts order items
-- 3. Updates stock
-- 4. Commits or Rolls Back
-- =========================================

BEGIN;

-- Insert new order
INSERT INTO orders
(order_id, customer_id, order_date, status, total_amount)
VALUES
(1011, 102, CURRENT_DATE, 'Pending', 1598.00);

-- Insert order item 1
INSERT INTO order_items
(item_id, order_id, product_id, quantity, unit_price, discount_pct)
VALUES
(5016, 1011, 202, 1, 799.00, 0);

-- Insert order item 2
INSERT INTO order_items
(item_id, order_id, product_id, quantity, unit_price, discount_pct)
VALUES
(5017, 1011, 208, 1, 599.00, 0);

-- Update stock for product 202
UPDATE products
SET stock_qty = stock_qty - 1
WHERE product_id = 202;

-- Update stock for product 208
UPDATE products
SET stock_qty = stock_qty - 1
WHERE product_id = 208;

COMMIT;

-- If any statement fails before COMMIT,
-- PostgreSQL automatically marks the
-- transaction as failed and you can execute:

ROLLBACK;


