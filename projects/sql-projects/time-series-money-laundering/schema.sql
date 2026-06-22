-- Schema for time-series money laundering dataset
CREATE TABLE IF NOT EXISTS `evan10725.time_series_trans_money_laund` (
    transaction_id STRING,
    account_id STRING,
    transaction_timestamp TIMESTAMP,
    amount NUMERIC,
    merchant_category STRING,
    location STRING,
    risk_score FLOAT64
)
PARTITION BY DATE(transaction_timestamp)
CLUSTER BY account_id;
