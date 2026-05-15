# Data Warehouse and Analytics Project

Welcome to the **Data Warehouse and Analytics Project** repository. This project is a hands-on exploration of data engineering best practices, focusing on building a modern data warehouse environment.

## 🎯 Objective
To develop a modern data warehouse using **MS SQL Server** that consolidates sales data from disparate sources, enabling high-quality analytical reporting and data-driven decision-making.

---

## 🏗️ Architecture Overview
The project follows a tiered data architecture to ensure data quality and traceability:
1.  **Bronze (Staging):** Raw data ingestion from source systems.
2.  **Silver:** Data cleansing, standardization, and quality checks.
3.  **Gold:** Final transformed models optimized for analytics.

![Data Diagram](docs/SQLDataWarehouse.drawio.svg)

---

## 🛠️ Tech Stack
* **Database:** Microsoft SQL Server
* **Language:** T-SQL (Stored Procedures, Views, DDL/DML)
* **Tools:** SQL Server Management Studio (SSMS), Draw.io (Architecture Diagrams)
* **Data Sources:** CSV files from ERP and CRM systems

---

## 📋 Project Requirements & Specifications
### 1. Data Ingestion
- [x] Import ERP source data (CSV)
- [x] Import CRM source data (CSV)
- [x] Set up Bronze layer tables

### 2. Data Transformation (Silver Layer)
- [x] Standardize naming conventions
- [x] Implement Data Quality (DQ) checks (Nulls, Duplicates, Range checks)
- [ ] Handle business logic transformations

### 3. Analytics & Reporting (Gold Layer)
- [ ] Design Fact and Dimension tables (Star Schema)
- [ ] Create analytical views for end-users

---

## 🚀 How to Use
1.  **Clone the repo:** `git clone https://github.com/jmalarchik/sql-data-warehouse-project.git`
2.  **Scripts:** Navigate to the `/scripts` folder to find the DDL for table creation and the DQ check scripts.
3.  **Tests:** Quality assurance queries are located in the `/tests` directory.

---

## License

This project is licensed under the MIT License. You are free to use, modify, and share this project with proper attribution.

## About Me

Hi, I'm Jaime Malarchik.  I'm an aspiring data engineer with industry experience using SQL for regulatory compliance activities and enjoy working with data. I'm working on expanding my skill set working with data.
