WITH earnings_stats AS (
    SELECT
        symbol,
        SUM(CASE WHEN actual_eps > estimated_eps THEN 1 ELSE 0 END) AS beat_earnings,
        SUM(CASE WHEN actual_eps < estimated_eps THEN 1 ELSE 0 END) AS missed_earnings,
        SUM(CASE WHEN actual_eps = estimated_eps THEN 1 ELSE 0 END) AS met_earnings
    FROM {{ ref('src_earnings') }}
    WHERE announcement_date >= '2024-06-30'
    AND announcement_date <= '2024-09-30'
    GROUP BY symbol
),

metadata AS (
    SELECT * FROM {{ ref('src_metadata') }}
)

SELECT
    SUM(earnings_stats.beat_earnings) AS beat_earnings,
    SUM(earnings_stats.missed_earnings) AS missed_earnings,
    SUM(earnings_stats.met_earnings) AS met_earnings,
    metadata.industry
FROM 
    earnings_stats
JOIN
    metadata
ON
    earnings_stats.symbol = metadata.symbol
WHERE 
    metadata.is_sp_constituent = 'True'
GROUP BY 
    metadata.industry
