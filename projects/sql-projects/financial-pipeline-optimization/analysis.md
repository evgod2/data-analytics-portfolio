# Financial Pipeline Optimization – SQL Case Study

This project simulates an enterprise-scale financial transaction pipeline built inside Google BigQuery.  
The goal is to demonstrate SQL engineering, analytical modeling, and performance optimization techniques used in real production environments.

## Technologies
- Google BigQuery (SQL)
- Partitioned & Clustered Tables
- Window Functions
- CTEs & Subqueries
- Data Validation & Profiling

## Summary of Work
### Schema Engineering
Designed a partitioned and clustered BigQuery table optimized for append-only financial logs.

### Exploratory Analysis
Performed structural validation:
- Null checks  
- Transaction type distribution  
- Daily volume trends  

### Advanced Analytics
Used window functions to detect velocity spikes and anomalous behavior.

### KPI Reporting
Generated stakeholder-ready metrics:
- Daily volume  
- High-value transactions  
- Account-level summaries  
