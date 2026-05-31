# \-- =====================================

# \-- Table: Customers

# \-- Purpose: Store customer information

# \-- =====================================

# 

# CREATE TABLE customers (

# &#x20;   customer\_id   INT PRIMARY KEY,

# &#x20;   first\_name    VARCHAR(50) NOT NULL,

# &#x20;   last\_name     VARCHAR(50) NOT NULL,

# &#x20;   email         VARCHAR(100) UNIQUE NOT NULL,

# &#x20;   city          VARCHAR(50) NOT NULL,

# &#x20;   state         VARCHAR(50) NOT NULL,

# &#x20;   join\_date     DATE NOT NULL,

# &#x20;   is\_premium    BOOLEAN DEFAULT FALSE

# );

# \-- Indexes for faster city/state filtering

# CREATE INDEX idx\_customers\_city ON customers(city);

# CREATE INDEX idx\_customers\_state ON customers(state);

# 

# \-- =========================================

# \-- TABLE: PRODUCTS

# \-- Purpose: Store product information

# \-- =========================================

# 

# CREATE TABLE products (

# &#x20;   product\_id    INT PRIMARY KEY,

# &#x20;   product\_name  VARCHAR(100) NOT NULL,

# &#x20;   category      VARCHAR(50) NOT NULL,

# &#x20;   brand         VARCHAR(50) NOT NULL,

# &#x20;   unit\_price    DECIMAL(10,2) NOT NULL CHECK (unit\_price > 0),

# &#x20;   stock\_qty     INT NOT NULL DEFAULT 0 CHECK (stock\_qty >= 0)

# );

# \-- Index for filtering products by category

# CREATE INDEX idx\_products\_category

# ON products(category);

# 

# \-- =========================================

# \-- TABLE: ORDERS

# \-- Purpose: Store customer orders

# \-- =========================================

# 

# CREATE TABLE orders (

# &#x20;   order\_id      INT PRIMARY KEY,

# &#x20;   customer\_id   INT NOT NULL,

# &#x20;   order\_date    DATE NOT NULL,

# 

# &#x20;   status        VARCHAR(20) NOT NULL DEFAULT 'Pending'

# &#x20;                 CHECK (status IN ('Pending','Shipped','Delivered','Cancelled')),

# 

# &#x20;   total\_amount  DECIMAL(12,2) NOT NULL

# &#x20;                 CHECK (total\_amount >= 0),

# 

# &#x20;   FOREIGN KEY (customer\_id)

# &#x20;       REFERENCES customers(customer\_id)

# );

# 

# \-- Index for date-based filtering

# CREATE INDEX idx\_orders\_date

# ON orders(order\_date);

# 

# \-- Index for order status filtering

# CREATE INDEX idx\_orders\_status

# ON orders(status);

# \-- =========================================

# \-- TABLE: ORDER\_ITEMS

# \-- Purpose: Store products included in each order

# \-- =========================================

# 

# CREATE TABLE order\_items (

# &#x20;   item\_id       INT PRIMARY KEY,

# &#x20;   order\_id      INT NOT NULL,

# &#x20;   product\_id    INT NOT NULL,

# &#x20;   quantity      INT NOT NULL CHECK (quantity > 0),

# &#x20;   unit\_price    DECIMAL(10,2) NOT NULL CHECK (unit\_price > 0),

# &#x20;   discount\_pct  DECIMAL(5,2) DEFAULT 0

# &#x20;                 CHECK (discount\_pct BETWEEN 0 AND 100),

# 

# &#x20;   FOREIGN KEY (order\_id)

# &#x20;   REFERENCES orders(order\_id),

# 

# &#x20;   FOREIGN KEY (product\_id)

# &#x20;   REFERENCES products(product\_id)

# );

# 

# \-- ========== INSERT: customers ==========

# INSERT INTO customers VALUES

# (101, 'Aarav',  'Sharma', 'aarav.s@email.com',  'Mumbai',    'Maharashtra', '2024-01-15', TRUE),

# (102, 'Priya',  'Patel',  'priya.p@email.com',  'Ahmedabad', 'Gujarat',     '2024-02-20', FALSE),

# (103, 'Rohan',  'Gupta',  'rohan.g@email.com',  'Delhi',     'Delhi',       '2024-03-10', TRUE),

# (104, 'Sneha',  'Reddy',  'sneha.r@email.com',  'Hyderabad', 'Telangana',   '2024-04-05', FALSE),

# (105, 'Vikram', 'Singh',  'vikram.s@email.com', 'Jaipur',    'Rajasthan',   '2024-05-12', TRUE),

# (106, 'Ananya', 'Iyer',   'ananya.i@email.com', 'Chennai',   'Tamil Nadu',  '2024-06-18', FALSE),

# (107, 'Karan',  'Mehta',  'karan.m@email.com',  'Pune',      'Maharashtra', '2024-07-22', TRUE),

# (108, 'Divya',  'Nair',   'divya.n@email.com',  'Kochi',     'Kerala',      '2024-08-30', FALSE);

# 

# \-- ========== INSERT: products ==========

# INSERT INTO products VALUES

# (201, 'Wireless Earbuds',     'Electronics', 'BoAt',          1499.00, 250),

# (202, 'Cotton T-Shirt',       'Clothing',    'Levis',         799.00,  500),

# (203, 'Smart Watch',          'Electronics', 'Noise',         2999.00, 150),

# (204, 'Running Shoes',        'Clothing',    'Nike',          4599.00, 120),

# (205, 'Bluetooth Speaker',    'Electronics', 'JBL',           3499.00, 200),

# (206, 'Bedsheet Set',         'Home',        'Spaces',        1299.00, 300),

# (207, 'Laptop Stand',         'Electronics', 'AmazonBasics',  899.00,  180),

# (208, 'Cushion Covers (Set)', 'Home',        'HomeCenter',    599.00,  400);

# 

# \-- ========== INSERT: orders ==========

# INSERT INTO orders VALUES

# (1001, 101, '2024-08-01', 'Delivered',  4498.00),

# (1002, 102, '2024-08-03', 'Delivered',  799.00),

# (1003, 103, '2024-08-05', 'Shipped',    7498.00),

# (1004, 101, '2024-08-10', 'Delivered',  3499.00),

# (1005, 104, '2024-08-12', 'Cancelled',  2999.00),

# (1006, 105, '2024-08-15', 'Delivered',  5898.00),

# (1007, 106, '2024-08-18', 'Pending',    1299.00),

# (1008, 103, '2024-08-20', 'Delivered',  899.00),

# (1009, 107, '2024-08-25', 'Shipped',    6098.00),

# (1010, 108, '2024-08-28', 'Delivered',  1598.00);

# 

# \-- ========== INSERT: order\_items ==========

# INSERT INTO order\_items VALUES

# (5001, 1001, 201, 2, 1499.00, 0),

# (5002, 1001, 207, 1, 899.00,  10),

# (5003, 1002, 202, 1, 799.00,  0),

# (5004, 1003, 203, 1, 2999.00, 0),

# (5005, 1003, 204, 1, 4599.00, 5),

# (5006, 1004, 205, 1, 3499.00, 0),

# (5007, 1005, 203, 1, 2999.00, 0),

# (5008, 1006, 201, 1, 1499.00, 10),

# (5009, 1006, 204, 1, 4599.00, 5),

# (5010, 1007, 206, 1, 1299.00, 0),

# (5011, 1008, 207, 1, 899.00,  0),

# (5012, 1009, 205, 1, 3499.00, 0),

# (5013, 1009, 208, 2, 599.00,  15),

# (5014, 1010, 206, 1, 1299.00, 0),





# **Section A — SQL Basics (SELECT, Constraints, Primary Keys)** 

# 

# \-- =========================================

# \-- Q1. Display all columns and rows from the customers table

# \-- =========================================

# 

# SELECT \*

# FROM customers;



# | customer\_id | first\_name | last\_name | email                                           | city      | state       | join\_date  | is\_premium |

# | ----------- | ---------- | --------- | ----------------------------------------------- | --------- | ----------- | ---------- | ---------- |

# | 101         | Aarav      | Sharma    | \[aarav.s@email.com](mailto:aarav.s@email.com)   | Mumbai    | Maharashtra | 2024-01-15 | TRUE       |

# | 102         | Priya      | Patel     | \[priya.p@email.com](mailto:priya.p@email.com)   | Ahmedabad | Gujarat     | 2024-02-20 | FALSE      |

# | 103         | Rohan      | Gupta     | \[rohan.g@email.com](mailto:rohan.g@email.com)   | Delhi     | Delhi       | 2024-03-10 | TRUE       |

# | 104         | Sneha      | Reddy     | \[sneha.r@email.com](mailto:sneha.r@email.com)   | Hyderabad | Telangana   | 2024-04-05 | FALSE      |

# | 105         | Vikram     | Singh     | \[vikram.s@email.com](mailto:vikram.s@email.com) | Jaipur    | Rajasthan   | 2024-05-12 | TRUE       |

# | 106         | Ananya     | Iyer      | \[ananya.i@email.com](mailto:ananya.i@email.com) | Chennai   | Tamil Nadu  | 2024-06-18 | FALSE      |

# | 107         | Karan      | Mehta     | \[karan.m@email.com](mailto:karan.m@email.com)   | Pune      | Maharashtra | 2024-07-22 | TRUE       |

# | 108         | Divya      | Nair      | \[divya.n@email.com](mailto:divya.n@email.com)   | Kochi     | Kerala      | 2024-08-30 | FALSE      |

# 

# INSIGHT:

# The customers table contains 8 customer records from different cities and states across India. Four customers are premium members and four are non-premium members.

# 

# 

# \-- =========================================

# \-- Q2. Retrieve only the first\_name, last\_name, and city of all customers.

# \-- =========================================

# 

# SELECT first\_name, last\_name, city

# FROM customers;

# 

# Result:

# 

# | first\_name | last\_name | city      |

# | ---------- | --------- | --------- |

# | Aarav      | Sharma    | Mumbai    |

# | Priya      | Patel     | Ahmedabad |

# | Rohan      | Gupta     | Delhi     |

# | Sneha      | Reddy     | Hyderabad |

# | Vikram     | Singh     | Jaipur    |

# | Ananya     | Iyer      | Chennai   |

# | Karan      | Mehta     | Pune      |

# | Divya      | Nair      | Kochi     |

# 

# Insight:

# This query displays basic customer information and shows that customers are distributed across multiple cities in India.

# 

# \-- =========================================

# \-- Q3. List all unique categories available in the products table.

# \-- =========================================

# 

# SELECT DISTINCT category

# FROM products;

# 

# Result:

# 

# | category    |

# | ----------- |

# | Electronics |

# | Clothing    |

# | Home        |

# 

# Insight:

# The product catalog contains three distinct categories: Electronics, Clothing, and Home.

# 

# \-- =========================================

# \-- Q4. Identify the Primary Key of each table in the schema.

# \-- Explain why a Primary Key must be unique and NOT NULL.

# \-- =========================================

# 

# Result:

# 

# | Table       | Primary Key |

# | ----------- | ----------- |

# | customers   | customer\_id |

# | products    | product\_id  |

# | orders      | order\_id    |

# | order\_items | item\_id     |

# 

# Explanation:

# A Primary Key uniquely identifies each record in a table. It must be UNIQUE to avoid duplicate records and NOT NULL to ensure every row can be identified. Primary Keys also help establish relationships between tables through Foreign Keys.

# 

# Insight:

# Primary Keys maintain data integrity and ensure that every row can be uniquely referenced.

# 

# \-- =========================================

# \-- Q5. What constraints are applied to the email column

# \-- in the customers table?

# \-- =========================================

# 

# Column Definition:

# 

# email VARCHAR(100) UNIQUE NOT NULL

# 

# Result:

# 

# | Constraint | Purpose                            |

# | ---------- | ---------------------------------- |

# | UNIQUE     | Prevents duplicate email addresses |

# | NOT NULL   | Prevents empty email values        |

# 

# Example:

# 

# INSERT INTO customers

# (customer\_id, first\_name, last\_name, email, city, state, join\_date)

# VALUES

# (109, 'Rahul', 'Verma', '\[aarav.s@email.com](mailto:aarav.s@email.com)', 'Delhi', 'Delhi', '2024-09-01');

# 

# Expected Error:

# 

# ERROR: duplicate key value violates unique constraint

# 

# Insight:

# The UNIQUE constraint ensures that every customer has a distinct email address, while NOT NULL guarantees that email information is always provided.

# 

# \-- =========================================

# \-- Q6. Try inserting a product with unit\_price = -50.

# \-- =========================================

# 

# INSERT INTO products

# (product\_id, product\_name, category, brand, unit\_price, stock\_qty)

# VALUES

# (209, 'Test Product', 'Electronics', 'TestBrand', -50, 10);

# 

# Expected Result:

# 

# | Status        |

# | ------------- |

# | Insert Failed |

# 

# Expected Error:

# 

# ERROR: new row for relation "products" violates check constraint

# 

# Constraint Responsible:

# 

# CHECK (unit\_price > 0)

# 

# Insight:

# The CHECK constraint prevents invalid product prices from being stored and helps maintain accurate business data.



# **Section B — Filtering \& Optimization (WHERE, Indexes)** 



# \-- =========================================

# \-- Q7. Retrieve all orders with status = 'Delivered'.

# \-- =========================================

# 

# SELECT \*

# FROM orders

# WHERE status = 'Delivered';

# 

# Result:

# 

# | order\_id | customer\_id | order\_date | status    | total\_amount |

# | -------- | ----------- | ---------- | --------- | ------------ |

# | 1001     | 101         | 2024-08-01 | Delivered | 4498.00      |

# | 1002     | 102         | 2024-08-03 | Delivered | 799.00       |

# | 1004     | 101         | 2024-08-10 | Delivered | 3499.00      |

# | 1006     | 105         | 2024-08-15 | Delivered | 5898.00      |

# | 1008     | 103         | 2024-08-20 | Delivered | 899.00       |

# | 1010     | 108         | 2024-08-28 | Delivered | 1598.00      |

# 

# Insight:

# Six orders have been successfully delivered, indicating that Delivered is the most frequent order status in the dataset.

# 

# \-- =========================================

# \-- Q8. Find all products in the 'Electronics'

# \-- category with a unit\_price greater than ₹2000.

# \-- =========================================

# 

# SELECT \*

# FROM products

# WHERE category = 'Electronics'

# AND unit\_price > 2000;

# 

# Result:

# 

# | product\_id | product\_name      | category    | brand | unit\_price | stock\_qty |

# | ---------- | ----------------- | ----------- | ----- | ---------- | --------- |

# | 203        | Smart Watch       | Electronics | Noise | 2999.00    | 150       |

# | 205        | Bluetooth Speaker | Electronics | JBL   | 3499.00    | 200       |

# 

# Insight:

# Among electronic products, Smart Watch and Bluetooth Speaker are premium-priced items with prices above ₹2000.

# 

# \-- =========================================

# \-- Q9. List all customers who joined in 2024

# \-- and belong to the state 'Maharashtra'.

# \-- =========================================

# 

# SELECT \*

# FROM customers

# WHERE state = 'Maharashtra'

# AND join\_date BETWEEN '2024-01-01' AND '2024-12-31';

# 

# Result:

# 

# | customer\_id | first\_name | last\_name | city   | state       | join\_date  |

# | ----------- | ---------- | --------- | ------ | ----------- | ---------- |

# | 101         | Aarav      | Sharma    | Mumbai | Maharashtra | 2024-01-15 |

# | 107         | Karan      | Mehta     | Pune   | Maharashtra | 2024-07-22 |

# 

# Insight:

# Two customers from Maharashtra joined during 2024, representing Mumbai and Pune.

# 

# \-- =========================================

# \-- Q10. Find all orders placed between

# \-- '2024-08-10' and '2024-08-25' (inclusive)

# \-- that are NOT cancelled.

# \-- =========================================

# 

# SELECT \*

# FROM orders

# WHERE order\_date BETWEEN '2024-08-10' AND '2024-08-25'

# AND status <> 'Cancelled';

# 

# Result:

# 

# | order\_id | customer\_id | order\_date | status    | total\_amount |

# | -------- | ----------- | ---------- | --------- | ------------ |

# | 1004     | 101         | 2024-08-10 | Delivered | 3499.00      |

# | 1006     | 105         | 2024-08-15 | Delivered | 5898.00      |

# | 1007     | 106         | 2024-08-18 | Pending   | 1299.00      |

# | 1008     | 103         | 2024-08-20 | Delivered | 899.00       |

# | 1009     | 107         | 2024-08-25 | Shipped   | 6098.00      |

# 

# Insight:

# Five non-cancelled orders were placed during the specified period, showing continued customer activity throughout August.

# 

# \-- =========================================

# \-- Q11. Explain what the index idx\_orders\_date does.

# \-- =========================================

# 

# Index Definition:

# 

# CREATE INDEX idx\_orders\_date

# ON orders(order\_date);

# 

# Purpose:

# 

# The index stores order\_date values in a structure that allows PostgreSQL to locate matching rows quickly without scanning the entire orders table.

# 

# Sample Query:

# 

# SELECT \*

# FROM orders

# WHERE order\_date BETWEEN '2024-08-10'

# AND '2024-08-20';

# 

# Benefit:

# 

# Instead of checking every row in the table, PostgreSQL can directly locate the required date range using the index.

# 

# Insight:

# Date indexes significantly improve the performance of filtering, sorting, and reporting queries on large datasets.

# 

# \-- =========================================

# \-- Q12. Would the index be used for:

# \-- SELECT \* FROM customers

# \-- WHERE YEAR(join\_date) = 2024;

# \-- =========================================

# 

# Query:

# 

# SELECT \*

# FROM customers

# WHERE EXTRACT(YEAR FROM join\_date) = 2024;

# 

# Result:

# 

# The database may not efficiently use an index because the YEAR/EXTRACT function must be applied to every row before comparison.

# 

# Index-Friendly (SARGable) Query:

# 

# SELECT \*

# FROM customers

# WHERE join\_date >= '2024-01-01'

# AND join\_date < '2025-01-01';

# 

# Why Better?

# 

# The database can directly use an index on join\_date because no function is applied to the column.

# 

# Insight:

# SARGable queries allow indexes to be used efficiently, reducing query execution time and improving scalability.







# **Section C — Aggregation (GROUP BY, SUM, COUNT, AVG, MIN, MAX)** 



# \-- =========================================

# \-- Q13. Count the total number of orders

# \-- in the orders table.

# \-- =========================================

# 

# SELECT COUNT(\*) AS total\_orders

# FROM orders;

# 

# Result:

# 

# | total\_orders |

# | ------------ |

# | 10           |

# 

# Insight:

# The orders table contains 10 customer orders in total.

# 

# \-- =========================================

# \-- Q14. Find the total revenue (SUM of total\_amount)

# \-- from all 'Delivered' orders.

# \-- =========================================

# 

# SELECT SUM(total\_amount) AS total\_revenue

# FROM orders

# WHERE status = 'Delivered';

# 

# Result:

# 

# | total\_revenue |

# | ------------- |

# | 17191.00      |

# 

# Insight:

# Delivered orders generated a total revenue of ₹17,191, representing the majority of completed sales.

# 

# \-- =========================================

# \-- Q15. Calculate the average unit\_price

# \-- of products in each category.

# \-- =========================================

# 

# SELECT category,

# ROUND(AVG(unit\_price), 2) AS avg\_unit\_price

# FROM products

# GROUP BY category;

# 

# Result:

# 

# | category    | avg\_unit\_price |

# | ----------- | -------------: |

# | Clothing    |        2699.00 |

# | Electronics |        2224.00 |

# | Home        |         949.00 |

# 

# Insight:

# Clothing products have the highest average price, followed closely by Electronics, while Home products are comparatively more affordable.

# 

# \-- =========================================

# \-- Q16. For each order status, find the count

# \-- of orders and total revenue.

# \-- Sort by total revenue in descending order.

# \-- =========================================

# 

# SELECT status,

# COUNT(\*) AS order\_count,

# SUM(total\_amount) AS total\_revenue

# FROM orders

# GROUP BY status

# ORDER BY total\_revenue DESC;

# 

# Result:

# 

# | status    | order\_count | total\_revenue |

# | --------- | ----------- | ------------: |

# | Delivered | 6           |      17191.00 |

# | Shipped   | 2           |      13596.00 |

# | Cancelled | 1           |       2999.00 |

# | Pending   | 1           |       1299.00 |

# 

# Insight:

# Delivered orders contribute the highest revenue, while Cancelled and Pending orders account for only a small portion of total sales value.

# 

# \-- =========================================

# \-- Q17. Find the most expensive (MAX)

# \-- and cheapest (MIN) product in each category.

# \-- =========================================

# 

# SELECT category,

# MAX(unit\_price) AS max\_price,

# MIN(unit\_price) AS min\_price

# FROM products

# GROUP BY category;

# 

# Result:

# 

# | category    | max\_price | min\_price |

# | ----------- | --------: | --------: |

# | Clothing    |   4599.00 |    799.00 |

# | Electronics |   3499.00 |    899.00 |

# | Home        |   1299.00 |    599.00 |

# 

# Insight:

# Clothing has the widest price range, while Home products remain within a relatively lower pricing bracket.

# 

# \-- =========================================

# \-- Q18. List all product categories where

# \-- the average unit\_price is greater than ₹2000.

# \-- =========================================

# 

# SELECT category,

# ROUND(AVG(unit\_price), 2) AS avg\_unit\_price

# FROM products

# GROUP BY category

# HAVING AVG(unit\_price) > 2000;

# 

# Result:

# 

# | category    | avg\_unit\_price |

# | ----------- | -------------: |

# | Clothing    |        2699.00 |

# | Electronics |        2224.00 |

# 

# Insight:

# Only the Clothing and Electronics categories have an average product price above ₹2000, indicating they are the higher-value product segments.





# **Section D — Joins \& Relationships** 

# \-- =========================================

# \-- Q19. Display each order along with the

# \-- customer's first\_name and last\_name.

# \-- =========================================

# 

# SELECT o.order\_id,

# o.order\_date,

# c.first\_name,

# c.last\_name,

# o.total\_amount

# FROM orders o

# INNER JOIN customers c

# ON o.customer\_id = c.customer\_id;

# 

# Result:

# 

# | order\_id | order\_date | first\_name | last\_name | total\_amount |

# | -------- | ---------- | ---------- | --------- | -----------: |

# | 1001     | 2024-08-01 | Aarav      | Sharma    |      4498.00 |

# | 1002     | 2024-08-03 | Priya      | Patel     |       799.00 |

# | 1003     | 2024-08-05 | Rohan      | Gupta     |      7498.00 |

# | 1004     | 2024-08-10 | Aarav      | Sharma    |      3499.00 |

# | 1005     | 2024-08-12 | Sneha      | Reddy     |      2999.00 |

# | 1006     | 2024-08-15 | Vikram     | Singh     |      5898.00 |

# | 1007     | 2024-08-18 | Ananya     | Iyer      |      1299.00 |

# | 1008     | 2024-08-20 | Rohan      | Gupta     |       899.00 |

# | 1009     | 2024-08-25 | Karan      | Mehta     |      6098.00 |

# | 1010     | 2024-08-28 | Divya      | Nair      |      1598.00 |

# 

# Insight:

# The INNER JOIN combines customer and order information, allowing each order to be linked to the customer who placed it.

# 

# \-- =========================================

# \-- Q20. Using a LEFT JOIN, list ALL customers

# \-- and their orders (if any).

# \-- =========================================

# 

# SELECT c.customer\_id,

# c.first\_name,

# c.last\_name,

# o.order\_id,

# o.order\_date

# FROM customers c

# LEFT JOIN orders o

# ON c.customer\_id = o.customer\_id;

# 

# Result:

# 

# | customer\_id | first\_name | last\_name | order\_id | order\_date |

# | ----------- | ---------- | --------- | -------- | ---------- |

# | 101         | Aarav      | Sharma    | 1001     | 2024-08-01 |

# | 101         | Aarav      | Sharma    | 1004     | 2024-08-10 |

# | 102         | Priya      | Patel     | 1002     | 2024-08-03 |

# | 103         | Rohan      | Gupta     | 1003     | 2024-08-05 |

# | 103         | Rohan      | Gupta     | 1008     | 2024-08-20 |

# | 104         | Sneha      | Reddy     | 1005     | 2024-08-12 |

# | 105         | Vikram     | Singh     | 1006     | 2024-08-15 |

# | 106         | Ananya     | Iyer      | 1007     | 2024-08-18 |

# | 107         | Karan      | Mehta     | 1009     | 2024-08-25 |

# | 108         | Divya      | Nair      | 1010     | 2024-08-28 |

# 

# Insight:

# LEFT JOIN ensures all customers appear in the result, even if they have not placed any orders. In the current dataset, every customer has at least one order.

# 

# \-- =========================================

# \-- Q21. Show order details using joins across

# \-- orders, order\_items and products.

# \-- =========================================

# 

# SELECT o.order\_id,

# p.product\_name,

# oi.quantity,

# oi.unit\_price,

# oi.discount\_pct

# FROM orders o

# JOIN order\_items oi

# ON o.order\_id = oi.order\_id

# JOIN products p

# ON oi.product\_id = p.product\_id;

# 

# Result:

# 

# | order\_id | product\_name         | quantity | unit\_price | discount\_pct |

# | -------- | -------------------- | -------- | ---------: | -----------: |

# | 1001     | Wireless Earbuds     | 2        |    1499.00 |            0 |

# | 1001     | Laptop Stand         | 1        |     899.00 |           10 |

# | 1002     | Cotton T-Shirt       | 1        |     799.00 |            0 |

# | 1003     | Smart Watch          | 1        |    2999.00 |            0 |

# | 1003     | Running Shoes        | 1        |    4599.00 |            5 |

# | 1004     | Bluetooth Speaker    | 1        |    3499.00 |            0 |

# | 1005     | Smart Watch          | 1        |    2999.00 |            0 |

# | 1006     | Wireless Earbuds     | 1        |    1499.00 |           10 |

# | 1006     | Running Shoes        | 1        |    4599.00 |            5 |

# | 1007     | Bedsheet Set         | 1        |    1299.00 |            0 |

# | 1008     | Laptop Stand         | 1        |     899.00 |            0 |

# | 1009     | Bluetooth Speaker    | 1        |    3499.00 |            0 |

# | 1009     | Cushion Covers (Set) | 2        |     599.00 |           15 |

# | 1010     | Bedsheet Set         | 1        |    1299.00 |            0 |

# | 1010     | Cushion Covers (Set) | 1        |     599.00 |            0 |

# 

# Insight:

# Joining multiple tables provides a complete view of products purchased in each order along with quantities and discounts applied.

# 

# \-- =========================================

# \-- Q22. Difference between LEFT JOIN and

# \-- RIGHT JOIN. When would FULL OUTER JOIN

# \-- be used?

# \-- =========================================

# 

# LEFT JOIN Example:

# 

# SELECT \*

# FROM customers c

# LEFT JOIN orders o

# ON c.customer\_id = o.customer\_id;

# 

# Result:

# Returns all customers and matching orders. Customers without orders would still appear with NULL values in order columns.

# 

# RIGHT JOIN Example:

# 

# SELECT \*

# FROM customers c

# RIGHT JOIN orders o

# ON c.customer\_id = o.customer\_id;

# 

# Result:

# Returns all orders and matching customers. Orders without a valid customer would still appear with NULL customer information.

# 

# FULL OUTER JOIN:

# 

# SELECT \*

# FROM customers c

# FULL OUTER JOIN orders o

# ON c.customer\_id = o.customer\_id;

# 

# Result:

# Returns all rows from both tables, matching where possible and showing NULL where no match exists.

# 

# When to Use FULL OUTER JOIN:

# When you need to identify unmatched records from both sides, such as customers without orders and orders without valid customers.

# 

# Insight:

# LEFT JOIN focuses on preserving rows from the left table, RIGHT JOIN preserves rows from the right table, and FULL OUTER JOIN preserves rows from both.

# 

# \-- =========================================

# \-- Q23. Identify all Foreign Key relationships

# \-- in the schema.

# \-- =========================================

# 

# Foreign Key Relationships:

# 

# | Parent Table | Parent Key  | Child Table | Foreign Key |

# | ------------ | ----------- | ----------- | ----------- |

# | customers    | customer\_id | orders      | customer\_id |

# | orders       | order\_id    | order\_items | order\_id    |

# | products     | product\_id  | order\_items | product\_id  |

# 

# Example:

# 

# INSERT INTO orders

# VALUES

# (1011, 999, '2024-09-01', 'Pending', 1000.00);

# 

# Expected Result:

# 

# | Status        |

# | ------------- |

# | Insert Failed |

# 

# Expected Error:

# 

# ERROR: insert or update on table "orders"

# violates foreign key constraint

# 

# Reason:

# customer\_id = 999 does not exist in the customers table, so PostgreSQL rejects the insert to maintain referential integrity.

# 

# Insight:

# Foreign Keys ensure consistency between related tables and prevent orphan records from being created.

# 

# **Section E — Advanced Concepts (CASE, ACID, Transactions)** 

# 

# 

# \-- =========================================

# \-- Q24. Classify products into price tiers

# \-- using CASE.

# \-- =========================================

# 

# SELECT product\_name,

# unit\_price,

# CASE

# WHEN unit\_price < 1000 THEN 'Budget'

# WHEN unit\_price BETWEEN 1000 AND 3000 THEN 'Mid-Range'

# ELSE 'Premium'

# END AS price\_tier

# FROM products;

# 

# Result:

# 

# | product\_name         | unit\_price | price\_tier |

# | -------------------- | ---------: | ---------- |

# | Wireless Earbuds     |    1499.00 | Mid-Range  |

# | Cotton T-Shirt       |     799.00 | Budget     |

# | Smart Watch          |    2999.00 | Mid-Range  |

# | Running Shoes        |    4599.00 | Premium    |

# | Bluetooth Speaker    |    3499.00 | Premium    |

# | Bedsheet Set         |    1299.00 | Mid-Range  |

# | Laptop Stand         |     899.00 | Budget     |

# | Cushion Covers (Set) |     599.00 | Budget     |

# 

# Insight:

# Most products fall into the Budget and Mid-Range categories, while Running Shoes and Bluetooth Speaker are classified as Premium products.

# 

# \-- =========================================

# \-- Q25. Count Delivered vs Not Delivered

# \-- orders using CASE inside aggregate

# \-- functions.

# \-- =========================================

# 

# SELECT

# SUM(CASE WHEN status = 'Delivered' THEN 1 ELSE 0 END) AS delivered\_orders,

# SUM(CASE WHEN status <> 'Delivered' THEN 1 ELSE 0 END) AS not\_delivered\_orders

# FROM orders;

# 

# Result:

# 

# | delivered\_orders | not\_delivered\_orders |

# | ---------------- | -------------------- |

# | 6                | 4                    |

# 

# Insight:

# Out of 10 total orders, 6 have been delivered successfully while 4 are either pending, shipped, or cancelled.

# 

# \-- =========================================

# \-- Q26. Explain ACID Properties.

# \-- =========================================

# 

# Result:

# 

# | Property    | Meaning                                                       | Bank Transfer Example                                                                                           |

# | ----------- | ------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------- |

# | Atomicity   | A transaction is completed entirely or not at all.            | If ₹5000 is deducted from Account A but cannot be credited to Account B, the entire transaction is rolled back. |

# | Consistency | A transaction must leave the database in a valid state.       | Total money before and after the transfer remains unchanged.                                                    |

# | Isolation   | Concurrent transactions should not interfere with each other. | Two users withdrawing money simultaneously cannot see incomplete updates.                                       |

# | Durability  | Once committed, changes remain permanent even after failures. | After a successful transfer, the updated balances remain saved even if the server crashes.                      |

# 

# Insight:

# ACID properties ensure that database transactions remain reliable, accurate, and safe even during failures or concurrent access.

# 

# \-- =========================================

# \-- Q27. Write a SQL transaction that:

# \-- 1. Inserts a new order

# \-- 2. Inserts order items

# \-- 3. Updates stock

# \-- 4. Commits or Rolls Back

# \-- =========================================

# 

# BEGIN;

# 

# \-- Insert new order

# INSERT INTO orders

# (order\_id, customer\_id, order\_date, status, total\_amount)

# VALUES

# (1011, 102, CURRENT\_DATE, 'Pending', 1598.00);

# 

# \-- Insert order item 1

# INSERT INTO order\_items

# (item\_id, order\_id, product\_id, quantity, unit\_price, discount\_pct)

# VALUES

# (5016, 1011, 202, 1, 799.00, 0);

# 

# \-- Insert order item 2

# INSERT INTO order\_items

# (item\_id, order\_id, product\_id, quantity, unit\_price, discount\_pct)

# VALUES

# (5017, 1011, 208, 1, 599.00, 0);

# 

# \-- Update stock for product 202

# UPDATE products

# SET stock\_qty = stock\_qty - 1

# WHERE product\_id = 202;

# 

# \-- Update stock for product 208

# UPDATE products

# SET stock\_qty = stock\_qty - 1

# WHERE product\_id = 208;

# 

# COMMIT;

# 

# \-- If any statement fails before COMMIT,

# \-- PostgreSQL automatically marks the

# \-- transaction as failed and you can execute:

# 

# ROLLBACK;

# 

# Explanation:

# 

# 1\. BEGIN starts the transaction.

# 2\. The order record is inserted.

# 3\. Two order items are added.

# 4\. Product stock quantities are reduced.

# 5\. COMMIT permanently saves all changes.

# 6\. If any step fails (invalid foreign key, duplicate primary key, etc.), ROLLBACK restores the database to its previous state.

# 

# Insight:

# Transactions guarantee that all related operations succeed together or fail together, ensuring data integrity and preventing partial updates.



# 

# 

# 

# 

# 

# 

