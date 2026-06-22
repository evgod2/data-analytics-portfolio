-- Risk score distribution summary
SELECT
  risk_score,
  COUNT(*) AS count,
  AVG(amount) AS avg_amount
FROM `evan10725.time_series_trans_money_laund`
GROUP BY risk_score
ORDER BY risk_score DESC;

-- High-risk transactions (score >= 0.8)
SELECT
  account_id,
  transaction_timestamp,
  amount,
  merchant_category,
  location,
  risk_score
FROM `evan10725.time_series_trans_money_laund`
WHERE risk_score >= 0.8
ORDER BY risk_score DESC, transaction_timestamp;

-- Combine risk score with velocity + location anomalies
WITH velocity AS (
  SELECT
    account_id,
    transaction_timestamp,
    CASE
      WHEN LAG(amount) OVER (PARTITION BY account_id ORDER BY transaction_timestamp) IS NOT NULL
           AND amount > LAG(amount) OVER (PARTITION BY account_id ORDER BY transaction_timestamp) * 3
      THEN 1 ELSE 0
    END AS amount_spike_flag
  FROM `evan10725.time_series_trans_money_laund`
),

locations AS (
  SELECT
    account_id,
    transaction_timestamp,
    CASE
      WHEN LAG(location) OVER (PARTITION BY account_id ORDER BY transaction_timestamp) IS NOT NULL
           AND location != LAG(location) OVER (PARTITION BY account_id ORDER BY transaction_timestamp)
      THEN 1 ELSE 0
    END AS location_change_flag
  FROM `evan10725.time_series_trans_money_laund`
)

SELECT
  t.account_id,
  t.transaction_timestamp,
  t.amount,
  t.location,
  t.merchant_category,
  t.risk_score,
  v.amount_spike_flag,
  l.location_change_flag,
  CASE
    WHEN t.risk_score >= 0.8
         OR v.amount_spike_flag = 1
         OR l.location_change_flag = 1
    THEN 'HIGH_RISK'
    ELSE 'NORMAL'
  END AS combined_risk_label
FROM `evan10725.time_series_trans_money_laund` t
LEFT JOIN velocity v
  ON t.account_id = v.account_id
 AND t.transaction_timestamp = v.transaction_timestamp
LEFT JOIN locations l
  ON t.account_id = l.account_id
 AND t.transaction_timestamp = l.transaction_timestamp
ORDER BY combined_risk_label DESC, t.transaction_timestamp;

