CREATE TABLE IF NOT EXISTS `evan10725.financial_transactions` (
    transaction_id STRING,
    account_id STRING,
    transaction_timestamp TIMESTAMP,
    amount NUMERIC,
    transaction_type STRING,
    status STRING
)
PARTITION BY DATE(transaction_timestamp)
CLUSTER BY account_id;
