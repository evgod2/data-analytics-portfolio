# Time-Series Money Laundering Detection – SQL Case Study

This project analyzes a time-series dataset of financial transactions to identify suspicious activity patterns associated with money laundering.  
The goal is to detect anomalies in transaction velocity, amounts, locations, and risk scores using SQL-based analytical techniques.

## Technologies
- Google BigQuery (SQL)
- Time-Series Analysis
- Window Functions
- Partitioned & Clustered Tables
- Anomaly Detection Logic

## Summary of Work
### Schema Engineering
Defined a partitioned and clustered table optimized for time-series fraud detection queries.

### Exploratory Analysis
Performed structural validation:
- Null checks  
- Transaction volume over time  
- Merchant category distribution  
- Risk score distribution  

### Time-Series Anomaly Detection
Analyzed:
- Velocity spikes (rapid transactions in short windows)  
- Unusual transaction amounts  
- Location inconsistencies  
- High-risk merchant categories  

### Fraud Indicators
Generated insights on:
- Accounts with abnormal patterns  
- Transactions exceeding typical thresholds  
- High-risk clusters  
