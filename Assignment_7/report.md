# Delta Lake Incremental Data Processing Report

## Student Information

**Name:** Ayushi Gupta

**Assignment:** Delta Lake Incremental Data Processing

**Platform Used:** Databricks Free Edition

**Technology:** Apache Spark (PySpark), Delta Lake

---

# Objective

The objective of this assignment is to perform incremental data processing using Delta Lake. The workflow includes loading customer data, performing data cleaning, creating a Delta table, applying incremental updates using the MERGE operation, validating the results, and displaying the final merged dataset.

---

# Datasets Used

### 1. Customer Master Dataset
The master dataset contains the existing customer records.

**Columns:**
- CustomerID
- CustomerName
- City
- Category
- Price
- Quantity
- Discount
- Email

### 2. Customer Incremental Dataset
The incremental dataset contains updated customer information and new customer records that need to be merged into the existing Delta table.

---

# Methodology

## Step 1: Upload Dataset

Both datasets were uploaded into a Databricks Volume and loaded using PySpark.

---

## Step 2: Load Customer Master Dataset

The customer master dataset was loaded into a Spark DataFrame using the `spark.read.csv()` function with schema inference and header enabled.

---

## Step 3: Data Cleaning

Basic data cleaning was performed to improve data quality.

The following operations were carried out:

- Removed null values using `dropna()`
- Removed duplicate records using `dropDuplicates()`

This ensured that the dataset contained clean and consistent records before creating the Delta table.

---

## Step 4: Create Delta Table

The cleaned customer master dataset was stored in Delta format.

This Delta table became the target table for incremental processing.

---

## Step 5: Load Incremental Dataset

The incremental customer dataset was loaded into another Spark DataFrame.

The schema was verified to ensure it matched the master dataset.

---

## Step 6: MERGE Operation

Delta Lake's MERGE operation was used to perform incremental processing.

The merge condition was based on the **CustomerID** column.

The operation performed two actions:

- Updated existing customer records.
- Inserted new customer records that were not present in the master dataset.

---

## Step 7: Validation

The final Delta table was validated by checking:

- Total number of records
- Duplicate Customer IDs
- Null values

This confirmed that the merge operation completed successfully and the final dataset was consistent.

---

## Step 8: Final Output

The merged Delta table was displayed and exported as a CSV file for submission.

---

# Results

The assignment was completed successfully.

The following tasks were achieved:

- Uploaded customer datasets into Databricks.
- Loaded datasets using PySpark.
- Cleaned the data by removing null values and duplicate records.
- Created a Delta table.
- Loaded incremental customer data.
- Applied the Delta Lake MERGE operation.
- Updated existing customer records.
- Inserted new customer records.
- Validated the final dataset.
- Exported the final merged dataset.

---

# Challenges Faced

During implementation, a few challenges were encountered:

- DBFS root access was disabled in the Databricks Free Edition.
- Delta tables were created using a Databricks Volume instead of DBFS.
- Duplicate Customer IDs in the incremental dataset caused MERGE errors, which were resolved by removing duplicate records before merging.

---

# Conclusion

This assignment successfully demonstrated incremental data processing using Delta Lake.

The project highlighted the advantages of Delta Lake, including reliable data storage, efficient MERGE operations, and simplified handling of incremental updates. Data cleaning and validation ensured that the final dataset remained accurate and consistent after processing.

Overall, the assignment provided practical experience with Delta Lake features used in modern data engineering workflows.

---

# Screenshots Included

- Upload CSV Files
- Data Loading
- Data Cleaning
- Delta Table Creation (SCD1)
- Incremental Dataset
- MERGE Operation (SCD2)
- Validation
- Final Output
