WITH min_dif AS(
    SELECT
        *,
        DATEDIFF(minute,LAG(dt) OVER (ORDER BY sender, dt), dt) AS dif_min,
        row_number() OVER (ORDER BY sender,dt) AS ind
    FROM trans
),
row_num AS (
    SELECT 
        ind 
    FROM min_dif
    WHERE abs(dif_min) <= 60 
),
end_tb AS (
    SELECT 
        * 
    FROM min_dif
    WHERE ind IN (
        SELECT ind FROM row_num
        UNION
        SELECT ind-1 FROM row_num
    )
)
SELECT
    sender,
    MIN(dt) AS sequence_start,
    MAX(dt) AS sequence_end,
    COUNT(ind) AS transactions_count,
    SUM(amount) AS transaction_sum
FROM end_tb
GROUP BY sender
HAVING SUM(amount) >= 150
ORDER BY sender, MIN(dt), MAX(dt)