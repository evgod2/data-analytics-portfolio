SELECT
    DATE(transaction_timestamp) AS date,
    COUNT(*) AS total_transactions,
    SUM(amount) AS total_volume,
    AVG(amount) AS avg_transaction_size
FROM `evan10725.financial_transactions`
GROUP BY date
ORDER BY date;
