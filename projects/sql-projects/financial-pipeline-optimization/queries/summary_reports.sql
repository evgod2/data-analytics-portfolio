-- Daily KPIs for stakeholders
SELECT
    DATE(transaction_timestamp) AS date,
    COUNT(*) AS total_transactions,
    SUM(amount) AS total_volume,
    AVG(amount) AS avg_transaction_size,
    COUNTIF(amount > 1000) AS high_value_transactions
FROM `evan10725.financial_transactions`
GROUP BY date
ORDER BY date;

-- Account-level summary
SELECT
    account_id,
    COUNT(*) AS transaction_count,
    SUM(amount) AS total_spent,
    AVG(amount) AS avg_amount
FROM `evan10725.financial_transactions`
GROUP BY account_id
ORDER BY total_spent DESC;

