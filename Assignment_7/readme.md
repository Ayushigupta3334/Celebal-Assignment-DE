# Delta Lake Incremental Data Processing Assignment

## Objective
The objective of this assignment is to perform incremental data processing using Delta Lake in Databricks. The project demonstrates loading customer data, performing data cleaning, creating a Delta table, applying incremental updates using the MERGE operation, validating the results, and displaying the final dataset.

---

## Tools & Technologies
- Databricks Free Edition
- Apache Spark (PySpark)
- Delta Lake
- Python

---

## Project Structure

```
delta-lake-assignment/
│
├── data/
│   ├── customer_master.csv
│   ├── customer_incremental.csv
│  
│
├── notebooks/
│   └── delta_scd_assignment.ipynb
│
├── screenshots/
│   ├── data_loading.png
│   ├── data_uploading.png
│   ├── data_cleaning.png
│   ├── scd1.png
│   ├── validation2.png
│   ├── scd2.png
│   ├── validation.png
│   └── final_output.png
|
├── output/
└── final_output.csv
|
|
├── report/
│   └── report.md
│
└── README.md
```

---

## Dataset
The project uses two datasets:

- **customer_master.csv** – Initial customer dataset.
- **customer_incremental.csv** – Incremental dataset containing updated and new customer records.

---

## Steps Performed

### 1. Load Customer Master Dataset
- Uploaded the CSV file to Databricks Volume.
- Loaded the dataset using PySpark.

### 2. Data Cleaning
- Checked for null values.
- Removed null records.
- Removed duplicate records.

### 3. Create Delta Table
- Converted the cleaned dataset into a Delta table.
- Stored the Delta table in Databricks Volume.

### 4. Load Incremental Dataset
- Loaded the incremental customer dataset.
- Verified schema and data.

### 5. Incremental Processing (MERGE)
- Updated existing customer records.
- Inserted new customer records.
- Used Delta Lake MERGE operation based on **CustomerID**.

### 6. Validation
- Verified total row count.
- Checked duplicate Customer IDs.
- Checked null values after merging.

### 7. Final Output
- Displayed the final merged dataset.
- Exported the final dataset as a CSV file.

---

## Delta Lake Features Used
- Delta Table
- MERGE Operation
- Update Existing Records
- Insert New Records
- Data Validation

---

## Results
- Successfully loaded customer datasets.
- Cleaned the data by handling nulls and duplicates.
- Created a Delta table.
- Applied incremental updates using the MERGE operation.
- Validated the final dataset.
- Exported the final merged dataset.

---

## Conclusion
This assignment demonstrates how Delta Lake supports incremental data processing using the MERGE operation. Existing customer records were updated, new records were inserted, and the final dataset was validated successfully. Delta Lake provides efficient, reliable, and scalable data management for modern data engineering workflows.

---

## Author
**Ayushi Gupta**
