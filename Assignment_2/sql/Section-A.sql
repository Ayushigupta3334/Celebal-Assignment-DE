-- Q1. Display all columns and rows from the customers table
-- =========================================

SELECT *
FROM customers;

-- =========================================
-- Q2. Retrieve only the first_name, last_name, and city of all customers.
-- =========================================

SELECT first_name, last_name, city
FROM customers;

-- =========================================
-- Q3. List all unique categories available in the products table.
-- =========================================

SELECT DISTINCT category
FROM products;
-- =========================================
-- Q4. Identify the Primary Key of each table in the schema.
-- Explain why a Primary Key must be unique and NOT NULL.
-- =========================================

-- =========================================
-- Q5. What constraints are applied to the email column
-- in the customers table?
-- =========================================

Column Definition:

email VARCHAR(100) UNIQUE NOT NULL
-- =========================================
-- Q6. Try inserting a product with unit_price = -50.
-- =========================================

INSERT INTO products
(product_id, product_name, category, brand, unit_price, stock_qty)
VALUES
(209, 'Test Product', 'Electronics', 'TestBrand', -50, 10);

