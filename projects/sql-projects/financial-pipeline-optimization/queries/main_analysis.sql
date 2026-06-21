-- Detect transaction velocity spikes using window functions
WITH ordered AS (
    SELECT
        account_id,
        transaction_timestamp,
        amount,
        LAG(amount) OVER (
            PARTITION BY account_id
            ORDER BY transaction_timestamp
        ) AS prev_amount,
        LEAD(amount) OVER (
            PARTITION BY account_id
            ORDER BY transaction_timestamp
        ) AS next_amount
    FROM `evan10725.financial_transactions`
)

SELECT
    account_id,
    transaction_timestamp,
    amount,
    prev_amount,
    next_amount,
    CASE
        WHEN prev_amount IS NOT NULL
             AND amount > prev_amount * 3
        THEN 'velocity_spike'
        ELSE 'normal'
    END AS anomaly_flag
FROM ordered
ORDER BY account_id, transaction_timestamp;
