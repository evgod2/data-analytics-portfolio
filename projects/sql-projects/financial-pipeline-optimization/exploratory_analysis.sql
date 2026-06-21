SELECT COUNT(*) AS total_rows
FROM `evan10725.financial_transactions`;

SELECT
  SUM(CASE WHEN amount IS NULL THEN 1 ELSE 0 END) AS null_amounts,
  SUM(CASE WHEN transaction_type IS NULL THEN 1 ELSE 0 END) AS null_types,
  SUM(CASE WHEN status IS NULL THEN 1 ELSE 0 END) AS null_status
FROM `evan10725.financial_transactions`;

SELECT transaction_type, COUNT(*) AS count
FROM `evan10725.financial_transactions`
GROUP BY transaction_type
ORDER BY count DESC;
