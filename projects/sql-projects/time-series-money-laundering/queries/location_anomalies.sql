-- Detect location anomalies (impossible travel, inconsistent patterns)
WITH ordered AS (
  SELECT
    account_id,
    transaction_timestamp,
    location,
    amount,
    LAG(location) OVER (
      PARTITION BY account_id
      ORDER BY transaction_timestamp
    ) AS prev_location,
    LAG(transaction_timestamp) OVER (
      PARTITION BY account_id
      ORDER BY transaction_timestamp
    ) AS prev_ts
  FROM `evan10725.time_series_trans_money_laund`
),

flags AS (
  SELECT
    account_id,
    transaction_timestamp,
    location,
    prev_location,
    amount,
    prev_ts,
    TIMESTAMP_DIFF(transaction_timestamp, prev_ts, MINUTE) AS minutes_between,
    CASE
      WHEN prev_location IS NOT NULL AND location != prev_location THEN 1 ELSE 0
    END AS location_change_flag,
    CASE
      WHEN prev_ts IS NOT NULL
           AND location != prev_location
           AND TIMESTAMP_DIFF(transaction_timestamp, prev_ts, MINUTE) < 60
      THEN 1 ELSE 0
    END AS impossible_travel_flag
  FROM ordered
)

SELECT
  account_id,
  transaction_timestamp,
  location,
  prev_location,
  minutes_between,
  amount,
  CASE
    WHEN impossible_travel_flag = 1 THEN 'IMPOSSIBLE_TRAVEL'
    WHEN location_change_flag = 1 THEN 'LOCATION_CHANGE'
    ELSE 'NORMAL'
  END AS anomaly_type
FROM flags
ORDER BY account_id, transaction_timestamp;
