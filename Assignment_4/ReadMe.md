````markdown
# Azure Data Factory - Week 4 Assignment & Mini Project

## Overview

This repository contains the Week 4 Azure Data Factory (ADF) assignment and Mini Project. The project demonstrates how to create Azure resources, configure Blob Storage, build data pipelines using Azure Data Factory, validate file metadata, copy data between locations, and manage access using IAM roles.

---

# Folder Structure

```text
Week4_ADF_Project/
│
├── Task_1
│   ├── Resource_group1.png
│   └── Resource_Group2.png
│
├── Task_2
│   ├── container.png
│   ├── uploaded_file.png 
│
├── Task_3
│   ├── linked_service.png
│   ├── DataSet.png
│   ├── MetaData_Activity1.png
│   └── MetaData_Activity2.png
│
├── Task_4
│   ├── Monitor_CopyCsvPipeline.png
│   └── CopyCSvPipeline.png
│
├── Task_5
│   ├── Pipeline_Execution
│
├── Task_6
│   ├── Role_Assignments.png
│   
│
├── Mini_Project/
│   ├── Pipeline_Executed_Successfully.png
│   ├── Meta_Data_Validation.png
│   ├── Data_Copied.png
|   ├── Superstore_raw.csv
│   └── output.csv
│
└── Week4_Brief_Summary.txt
```

---

# Task 1: Resource Group Creation

## Objective
Create a Resource Group in Azure Portal.

## Steps Performed
- Logged into Azure Portal.
- Created a new Resource Group.
- Selected appropriate subscription and region.

## Deliverable
- Screenshot of Resource Group creation.

---

# Task 2: Storage Setup

## Objective
Create Azure Storage resources and upload a CSV file.

## Steps Performed
- Created a Storage Account.
- Created a Blob Container named `input-data`.
- Uploaded a CSV file into Blob Storage.

## Deliverable
- Screenshot of Storage Account.
- Screenshot of Blob Container.
- Screenshot showing uploaded CSV file.

---

# Task 3: Azure Data Factory Basics

## Objective
Configure Azure Data Factory and establish connectivity with Blob Storage.

## Steps Performed

### Linked Service
- Created Azure Blob Storage Linked Service.

### Source Dataset
- Created dataset pointing to source CSV file.

### Destination Dataset
- Created dataset for destination output location.

### Get Metadata Activity
- Configured metadata validation:
  - Exists
  - Size
  - Last Modified

## Deliverable
- Linked Service screenshot.
- Source Dataset screenshot.
- Destination Dataset screenshot.
- Get Metadata Activity screenshot.

---

# Task 4: Pipeline Development

## Objective
Create a data pipeline for copying data.

## Steps Performed
- Created pipeline `CopyCSVPipeline`.
- Added Copy Data Activity.
- Configured source and destination datasets.

## Deliverable
- Screenshot of pipeline design.

---

# Task 5: Pipeline Execution

## Objective
Execute the pipeline and verify successful execution.

## Steps Performed
- Executed pipeline using Trigger/Debug.
- Monitored execution status.

## Result
- Pipeline executed successfully.

## Deliverable
- Screenshot showing Status = Succeeded.

---

# Task 6: IAM Role Assignment

## Objective
Assign required permissions.

## Roles Assigned
- Reader
- Contributor
- Storage Blob Data Contributor

## Purpose
- Enable secure access to Azure resources.
- Allow Azure Data Factory to access Blob Storage.

## Deliverable
- Screenshot of role assignments.

---

# Mini Project

## Problem Statement

Build a complete Azure Data Factory pipeline that reads a CSV file from Azure Blob Storage and processes it.

---

## Requirements

### Source
- CSV file stored in Azure Blob Storage.

### Components Used
- Linked Service
- Dataset
- Pipeline

### Process
1. Metadata Validation
2. Data Copy Operation

### Destination
- New file generated in destination folder.

---

## Pipeline Workflow

```text
Source CSV
     │
     ▼
Get Metadata
     │
     ▼
Copy Data
     │
     ▼
Destination CSV
```

## Activities Used

### Get Metadata
Validated:
- File existence
- File size
- Last modified timestamp

### Copy Data
Copied data from source location to destination location.

---

## Expected Output

- Pipeline executed successfully.
- Metadata validated successfully.
- Data copied to destination.
- Output file generated.

---

## Result

The Azure Data Factory pipeline successfully connected to Azure Blob Storage, validated metadata using Get Metadata activity, copied CSV data using Copy Data activity, and generated the output file in the destination folder.

---

# Week 4 Brief Summary

During Week 4, Azure cloud services were explored by creating and managing Azure resources. A Resource Group was created to organize project resources. Azure Blob Storage was configured using a Storage Account and Blob Container, and a CSV file was uploaded.

Azure Data Factory was used to create Linked Services and Datasets for connecting to Blob Storage. A Get Metadata activity was configured to validate file properties before processing. A Copy Data pipeline was developed and executed successfully, transferring data from a source CSV file to a destination location.

IAM role assignments were configured to manage permissions and enable secure interaction between Azure Data Factory and Blob Storage.

The Mini Project integrated all concepts by building a complete end-to-end data pipeline that validated metadata and copied data successfully using Azure Data Factory.
````


