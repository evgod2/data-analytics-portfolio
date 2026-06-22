-- Detect rapid-fire transactions (velocity spikes)
WITH ordered AS (
  SELECT
    account_id,
    transaction_timestamp,
    amount,
    LAG(transaction_timestamp) OVER (
      PARTITION BY account_id
      ORDER BY transaction_timestamp
    ) AS prev_ts,
    LAG(amount) OVER (
      PARTITION BY account_id
      ORDER BY transaction_timestamp
    ) AS prev_amount
  FROM `evan10725.time_series_trans_money_laund`
),

velocity AS (
  SELECT
    account_id,
    transaction_timestamp,
    amount,
    prev_ts,
    prev_amount,
    TIMESTAMP_DIFF(transaction_timestamp, prev_ts, SECOND) AS seconds_since_last,
    CASE
      WHEN prev_amount IS NOT NULL AND amount > prev_amount * 3 THEN 1 ELSE 0
    END AS amount_spike_flag,
    CASE
      WHEN prev_ts IS NOT NULL AND TIMESTAMP_DIFF(transaction_timestamp, prev_ts, SECOND) < 30 THEN 1 ELSE 0
    END AS rapid_fire_flag
  FROM ordered
)

SELECT
  account_id,
  transaction_timestamp,
  amount,
  seconds_since_last,
  amount_spike_flag,
  rapid_fire_flag,
  CASE
    WHEN amount_spike_flag = 1 AND rapid_fire_flag = 1 THEN 'HIGH_RISK'
    WHEN amount_spike_flag = 1 THEN 'AMOUNT_SPIKE'
    WHEN rapid_fire_flag = 1 THEN 'RAPID_FIRE'
    ELSE 'NORMAL'
  END AS anomaly_type
FROM velocity
ORDER BY account_id, transaction_timestamp;
