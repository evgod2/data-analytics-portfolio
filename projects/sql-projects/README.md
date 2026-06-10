# SQL Analytics & Data Engineering Projects

Database querying, data pipeline optimization, and advanced analytics projects demonstrating enterprise-scale SQL development and data-driven problem solving.

---

## 📊 Featured Project

### Project 1: High-Volume Enterprise Financial Pipeline & Transaction Optimization

- **Status:** in progress
- **Objective:** Architected a data warehousing and processing pipeline inside Google BigQuery to ingest, clean, and analyze multi-gigabyte transaction histories to isolate operational anomalies and transaction velocity patterns.
- **Database System:** Google BigQuery (SQL) & Google Cloud Platform (GCP)
- **Approach:**
  - Designed scalable relational schema models optimized for massive append-only transaction logs.
  - Engineered advanced analytical queries to aggregate granular data into rolling 24-hour account profiles.
  - Optimized execution paths, partitioned tables, and structured nested queries to reduce computation overhead on multi-gigabyte tables.
- **Key Findings:**
  - Identified systematic transaction velocity spikes that pointed directly to configuration bottlenecks and high-risk network latency gaps.
  - Isolated behavioral transaction structuring patterns by isolating accounts executing repetitive, high-frequency actions placed just below traditional reporting boundaries.
- **Skills Demonstrated:**
  - Common Table Expressions (CTEs) & Subqueries
  - Advanced Window Functions (`PARTITION BY`, `LAG`, `LEAD`)
  - Database Performance Optimization & Cost Management
  - Data Validation, Profiling, and Ingestion Engineering

### Files Included
- `schema.sql` - Production table schemas, partitioning, and clustering strategies
- `queries/exploratory_analysis.sql` - Preliminary data profiling and schema validation
- `queries/main_analysis.sql` - Core pipeline scripts utilizing complex analytical window functions
- `analysis.md` - Technical project write-up detailing performance metrics and business impact

---

## 🛠️ Core SQL Techniques Demonstrated

### Advanced Data Querying
*   **Complex JOIN Operations:** Integrating high-volume transaction databases with historical account metadata using optimized `INNER JOIN` and `LEFT JOIN` operations.
*   **Hierarchical Execution:** Utilizing Common Table Expressions (CTEs) to simplify long-form logic into logical, maintainable, and high-performance processing blocks.
*   **Analytical Window Functions:** Applying functions like `ROW_NUMBER()`, `RANK()`, `LAG()`, and `LEAD()` across multi-million row partitions to track time-series trends without slowing down database performance.

### Enterprise Data Engineering
*   **Exploratory Data Analysis (EDA):** Profiling massive production tables to check for structural changes, null handling, and data type mismatches.
*   **Data Validation & Quality Auditing:** Writing integrity constraint checks to filter out malformed records and ensure data precision prior to down-stream reporting.
*   **Time-Series Segmentation:** Grouping transactional patterns over moving historical windows to separate standard baseline activity from anomalous outliers.

### Performance Optimization
*   **Query Path Strategy:** Utilizing query execution plans to identify high-cost operations, shifting filtering operations up-stream to limit memory consumption.
*   **Resource Allocation:** Implementing table partitioning (by date) and clustering (by key IDs) within BigQuery to drastically lower costs and accelerate query scan times.

---

## 🗂️ Project Repository Structure

```text
sql-projects/
├── README.md                              <- Core technologies and technique index
└── financial-pipeline-optimization/       <- BigQuery Transaction Project
    ├── schema.sql                         <- Optimized table schemas and DDL scripts
    ├── queries/
    │   ├── exploratory_analysis.sql       <- Structural profiling and validation
    │   ├── main_analysis.sql              <- Window functions and operational logic
    │   └── summary_reports.sql            <- Aggregated KPI outputs for stakeholders
    └── analysis.md                        <- Full technical case study and results
