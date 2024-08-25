with raw_earnings AS (
    SELECT * FROM RAW_HISTORICAL_EARNINGS
)
SELECT
    symbol,
    date as announcement_date,
    fiscal_date_ending as fiscal_date_end,
    eps as actual_eps,
    eps_estimated as estimated_eps,
    revenue as actual_revenue,
    revenue_estimated as estimated_revenue
FROM raw_earnings