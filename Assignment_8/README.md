# E-Commerce Order Analytics System

## Project Overview
This project is an end-to-end E-Commerce Order Analytics System built using Python, Pandas, SQLite, and SQL. The system generates realistic e-commerce datasets, introduces data inconsistencies, performs data cleaning, loads cleaned data into a SQL database, and generates business insights through SQL analytics and a command-line reporting tool.

---

## Objectives
- Generate realistic e-commerce datasets.
- Introduce and handle data quality issues.
- Clean and validate datasets using Pandas.
- Load data into a SQL database.
- Perform analytics using SQL joins, aggregations, window functions, and CTEs.
- Conduct cohort and customer segmentation analysis.
- Build a CLI reporting tool for generating reports dynamically.

---

## Technologies Used
- Python
- Pandas
- Faker
- SQLite
- SQL
- Google Colab
- Git & GitHub

---

## Project Structure

```text
ecommerce-analytics-system/
│── data/
│   ├── raw/
│   │   ├── customers.csv
│   │   ├── products.csv
│   │   ├── orders.csv
│   │   └── order_items.csv
│   └── cleaned/
│       ├── customers_clean.csv
│       ├── products_clean.csv
│       ├── orders_clean.csv
│       └── order_items_clean.csv
│
│── scripts/
│   ├── generate_data.py
│   ├── clean_data.py
│   └── report_cli.py
│
│── sql/
│   ├── schema.sql
│   ├── aggregations.sql
│   ├── window_functions.sql
│   ├── cohort_analysis.sql
│   └── customer_segmentation.sql
│
│── output/
│   └── sample_reports/
│
│── ecommerce.db
└── README.md
```

---

## Dataset Description

### Customers
- customer_id
- customer_name
- email
- registration_date
- customer_type

### Products
- product_id
- product_name
- category
- subcategory
- cost_price

### Orders
- order_id
- customer_id
- order_date
- status
- region_code

### Order Items
- item_id
- order_id
- product_id
- quantity
- unit_price
- discount_percent

---

## Step 1: Data Generation
Generated realistic datasets using Faker and Python's random module.

Introduced intentional inconsistencies:
- Missing values
- Duplicate records
- Invalid emails
- Invalid dates
- Mismatched IDs

Exported datasets as CSV files.

---

## Step 2: Data Cleaning
Performed data cleaning using Pandas:
- Removed duplicates
- Handled missing values
- Corrected data types
- Removed invalid records
- Enforced referential integrity between tables

Exported cleaned datasets.

---

## Step 3: Database Creation
Created a SQLite database and loaded cleaned datasets into four tables:
- customers
- products
- orders
- order_items

Verified:
- Row counts
- Primary and foreign key relationships
- Referential integrity

---

## Step 4: SQL Analytics
Implemented SQL queries for:
- Total revenue by category
- Top customers by revenue
- Monthly order analysis
- Return analysis
- Category-wise metrics

Used:
- JOIN
- GROUP BY
- ORDER BY
- Aggregate functions

---

## Step 5: Window Functions and CTEs
Implemented:
- Customer lifetime value ranking
- Running totals
- Moving averages
- Monthly growth analysis
- Customer order sequencing

Used:
- CTE
- DENSE_RANK()
- ROW_NUMBER()
- SUM() OVER()
- AVG() OVER()
- LAG()

---

## Step 6: Cohort and Retention Analysis
Implemented:
- Customer cohorts based on first purchase month
- Cohort size calculation
- Monthly retention analysis
- Repeat customer analysis
- Churn identification

---

## Step 7: Customer Segmentation
Implemented:
- Purchase frequency segmentation
- Spend tier segmentation
- RFM-style analysis

Customer segments:
- One-Time
- Occasional
- Loyal
- VIP
- Regular
- At Risk

---

## Step 8: CLI Reporting Tool
Implemented a command-line reporting tool capable of generating reports dynamically.

Supported reports:
- Revenue Report
- Top Customers Report
- Retention Report

Example commands:

```bash
python report_cli.py --report revenue
python report_cli.py --report top_customers
python report_cli.py --report retention
```

---

## Edge Cases Handled
- Missing values
- Duplicate rows
- Invalid dates
- Invalid emails
- Mismatched foreign keys
- Empty result sets
- Invalid report names
- Database connection handling

---

## Sample Outputs
Screenshots of generated reports are available in:

```text
output/sample_reports/
```

---

## Key Learnings
- Synthetic data generation using Faker
- Data cleaning using Pandas
- Referential integrity validation
- SQL joins and aggregations
- Window functions and CTEs
- Cohort and retention analysis
- Customer segmentation using RFM metrics
- Building command-line data applications

---

## Author
**Ayushi Gupta**  
B.Tech CSE (Cyber Security)  
Poornima College of Engineering  
Celebal Excellence Intern – Data Engineering
