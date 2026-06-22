-- Basic row count
SELECT COUNT(*) AS total_transactions
FROM `evan10725.time_series_trans_money_laund`;

-- Null checks
SELECT
  SUM(CASE WHEN account_id IS NULL THEN 1 ELSE 0 END) AS null_accounts,
  SUM(CASE WHEN transaction_timestamp IS NULL THEN 1 ELSE 0 END) AS null_timestamps,
  SUM(CASE WHEN amount IS NULL THEN 1 ELSE 0 END) AS null_amounts,
  SUM(CASE WHEN merchant_category IS NULL THEN 1 ELSE 0 END) AS null_categories,
  SUM(CASE WHEN location IS NULL THEN 1 ELSE 0 END) AS null_locations,
  SUM(CASE WHEN risk_score IS NULL THEN 1 ELSE 0 END) AS null_risk_scores
FROM `evan10725.time_series_trans_money_laund`;

-- Transaction volume over time
SELECT
  DATE(transaction_timestamp) AS date,
  COUNT(*) AS transactions
FROM `evan10725.time_series_trans_money_laund`
GROUP BY date
ORDER BY date;

-- Merchant category distribution
SELECT
  merchant_category,
  COUNT(*) AS count
FROM `evan10725.time_series_trans_money_laund`
GROUP BY merchant_category
ORDER BY count DESC;

-- Risk score distribution
SELECT
  risk_score,
  COUNT(*) AS count
FROM `evan10725.time_series_trans_money_laund`
GROUP BY risk_score
ORDER BY risk_score DESC;
