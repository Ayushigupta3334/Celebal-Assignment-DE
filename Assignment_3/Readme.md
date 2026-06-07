# Customer Sales Insights Using SQL

## Overview

This project analyzes the Superstore dataset using SQL techniques to generate customer sales insights. The dataset was loaded into a raw table and then organized into separate customer, order, and product tables. Various SQL concepts including Subqueries, Common Table Expressions (CTEs), Window Functions, and Joins were applied to answer business-related questions and evaluate customer performance.

## Objectives

* Load the Superstore dataset into a SQL database.
* Create normalized tables: Customers, Orders, and Products.
* Use SELECT DISTINCT to remove duplicate records.
* Apply Subqueries for advanced filtering and analysis.
* Use CTEs to calculate aggregated metrics.
* Implement Window Functions for ranking and order analysis.
* Generate customer sales insights through business queries.

## Dataset

The Superstore dataset contains information related to:

* Customer details
* Product information
* Order transactions
* Sales and profit metrics
* Shipping information

## Project Workflow

### Step 1: Data Setup

The dataset was loaded into a table named `superstore_raw`.

Three tables were created from the raw dataset:

* customers
* orders
* products

Data was inserted using `SELECT DISTINCT` to ensure unique records.

### Step 2: SQL Analysis

The following SQL operations were performed:

#### Subqueries

* Find orders with sales greater than average sales.
* Find the highest sales order for each customer.

#### Common Table Expressions (CTEs)

* Calculate total sales for each customer.
* Identify customers whose sales are above average.

#### Window Functions

* Rank customers based on total sales.
* Assign row numbers to orders within each customer.
* Display the top 3 customers based on total sales.

#### Combined Query

A final query was created using:

* JOIN
* CTE
* Window Function

to display:

* Customer Name
* Total Sales
* Rank

### Step 3: Customer Sales Insights

Business-focused queries were used to answer:

* Who are the top 5 customers?
* Who are the bottom 5 customers?
* Which customers made only one order?
* Which customers have above-average sales?
* What is the highest order value per customer?

## Key Findings

* Customer sales varied significantly across the dataset.
* A small group of customers contributed a large portion of total revenue.
* Several customers placed only one order, indicating potential retention opportunities.
* Window Functions provided an efficient way to rank customer performance.
* CTEs simplified complex aggregation and filtering operations.

## Technologies Used

* Python
* Pandas
* SQLite
* SQL
* Google Colab / Jupyter Notebook

## Conclusion

This project demonstrates the practical use of SQL for business analytics. By applying Subqueries, CTEs, Window Functions, and Joins, meaningful insights were extracted from sales data. The analysis helped identify valuable customers, evaluate sales performance, and understand customer purchasing behavior, supporting data-driven decision-making.
