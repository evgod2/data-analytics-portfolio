-- Row count
SELECT COUNT(*) AS total_rows
FROM `evan10725.financial_transactions`;

-- Null checks
SELECT
  SUM(CASE WHEN amount IS NULL THEN 1 ELSE 0 END) AS null_amounts,
  SUM(CASE WHEN transaction_type IS NULL THEN 1 ELSE 0 END) AS null_types,
  SUM(CASE WHEN status IS NULL THEN 1 ELSE 0 END) AS null_status
FROM `evan10725.financial_transactions`;

-- Distribution of transaction types
SELECT transaction_type, COUNT(*) AS count
FROM `evan10725.financial_transactions`
GROUP BY transaction_type
ORDER BY count DESC;

-- Daily volume
SELECT
  DATE(transaction_timestamp) AS date,
  COUNT(*) AS transactions,
  SUM(amount) AS total_volume
FROM `evan10725.financial_transactions`
GROUP BY date
ORDER BY date;

