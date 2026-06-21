# Week_5
# Apache Spark Fundamentals Assignment

## Overview

This assignment demonstrates the fundamentals of Apache Spark using PySpark DataFrames. The objective was to understand
Spark's advantages over traditional MapReduce and perform data cleaning, transformation, filtering, aggregation, and grouping
operations on a real-world dataset.

## Objective

- Understand the limitations of MapReduce and the advantages of Apache Spark.
- Learn Spark DataFrame concepts and immutability.
- Perform data cleaning operations.
- Handle missing and inconsistent data.
- Apply filtering and transformation techniques.
- Perform aggregation and grouping operations.
- Build an end-to-end data processing pipeline.

## Dataset

**Sample Superstore Dataset**

The dataset contains sales transactions with information such as:

- Order Details
- Customer Information
- Product Categories
- Sales and Profit
- Region and State Information

## Technologies Used

- Apache Spark
- PySpark
- Google Colab
- Python

## Operations Performed

### 1. Data Loading
- Loaded CSV dataset into a Spark DataFrame.
- Inspected schema and data types.
- Displayed sample records.

### 2. Data Cleaning
- Removed duplicate records using `dropDuplicates()`.
- Checked and handled missing values.
- Filtered invalid records.
- Improved overall data quality.

### 3. Data Transformation
- Renamed columns where required.
- Converted date fields into timestamp format.
- Created new transformed columns.

### 4. Data Filtering
- Applied conditional filters on dataset records.
- Extracted specific subsets of data for analysis.

### 5. Aggregation
- Calculated:
  - Count
  - Average
  - Minimum
  - Maximum
  - Total Revenue

### 6. Grouping Operations
- Used `groupBy()` for category and regional analysis.
- Applied aggregate functions on grouped data.

### 7. Processing Pipeline
A complete Spark pipeline was created by combining:

- Data Loading
- Data Cleaning
- Data Filtering
- Data Transformation
- Aggregation

## Key Concepts Learned

### Apache Spark vs MapReduce

| MapReduce | Apache Spark |
|------------|-------------|
| Disk-based processing | In-memory processing |
| Slower execution | Faster execution |
| Complex programming model | Easy DataFrame API |
| Less suitable for iterative tasks | Ideal for iterative workloads |

### Spark DataFrame Immutability

Spark DataFrames are immutable, meaning operations such as filtering, renaming, or dropping columns create a new DataFrame
instead of modifying the original one.

### Shuffle Operations

Grouping and aggregation operations may trigger shuffle operations, where data is redistributed across partitions. Shuffles 
are expensive and can impact performance if not managed properly.

## Results and Observations

- Spark efficiently handled data transformation and analytical operations.
- Duplicate removal improved dataset quality.
- DataFrames provided a simple and scalable approach to data processing.
- Aggregation functions generated meaningful business insights.
- Grouping operations enabled region-wise and category-wise analysis.
- Spark's in-memory processing significantly improves performance compared to traditional MapReduce systems.

## Repository Structure

```text
spark-assignment/
│
├── Dataset/
│   └── superstore_raw.csv
│
├── Notebook/
│   └── Spark_Basics.ipynb
│
├── Output/
│   └── results.csv
│
└── README.md
```

## Output

The final cleaned and transformed dataset is available in:

```text
output/results.csv
```

The notebook containing all code, explanations, outputs, and observations is available in:

```text
notebook/Spark_Basics.ipynb
```

## Conclusion

This assignment provided hands-on experience with Apache Spark DataFrames, data cleaning, transformations, aggregations, and pipeline creation. It demonstrated how Spark simplifies large-scale data processing through efficient in-memory computation and a user-friendly programming model.
