WITH src_eps_forecasts AS (
    SELECT * FROM {{ ref('src_eps_forecasts') }}
)

SELECT
    announcement_date,
    symbol,
    ROUND(CAST(eps_prediction as numeric), 2) as eps_prediction
FROM src_eps_forecasts