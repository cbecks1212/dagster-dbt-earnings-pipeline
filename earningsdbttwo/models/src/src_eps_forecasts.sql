with raw_eps_forecast AS (
    SELECT * FROM raw_eps_pred
)
SELECT
    date as announcement_date,
    symbol,
    pred as eps_prediction
FROM raw_eps_forecast