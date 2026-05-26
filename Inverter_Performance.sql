SELECT * FROM avaada_energy.v_block_summary;

-- Top 5 Best Performing Inverters

SELECT inverter_id,
       block_no,
       specific_yield
FROM inverter_performance
ORDER BY specific_yield DESC
LIMIT 5;
,
-- Inverters Below Plant Average
SELECT inverter_id,
       specific_yield
FROM inverter_performance
WHERE specific_yield < 4.950;

-- Average Yield of Plant
SELECT ROUND(AVG(specific_yield),3) AS plant_avg_yield
FROM inverter_performanc;

-- Block-wise Average Yield
SELECT block_no,
       ROUND(AVG(specific_yield),3) AS avg_yield
FROM inverter_performance
GROUP BY block_no
ORDER BY avg_yield DESC;

-- Blocks Having Average Yield Above 5

SELECT block_no,
       ROUND(AVG(specific_yield),3) AS avg_yield
FROM inverter_performance
GROUP BY block_no
HAVING AVG(specific_yield) > 5;

-- Join Blocks with KPI Table

SELECT b.block_name,
       k.avg_specific_yield,
       k.block_rank
FROM blocks b
INNER JOIN block_kpi k
ON b.block_no = k.block_no;

-- Dynamic Performance Category

SELECT inverter_id,
       specific_yield,
       CASE
           WHEN specific_yield >= 5.0 THEN 'Excellent'
           WHEN specific_yield >= 4.95 THEN 'Good'
           ELSE 'Poor'
       END AS performance_grade
FROM inverter_performance;

-- Inverters Above Overall Average

SELECT inverter_id,
       specific_yield
FROM inverter_performance
WHERE specific_yield >
(
    SELECT AVG(specific_yield)
    FROM inverter_performance
);

-- Overall Inverter Ranking

SELECT inverter_id,
       block_no,
       specific_yield,
       RANK() OVER(ORDER BY specific_yield DESC) AS overall_rank
FROM inverter_performance;

-- Top Performing Blocks

WITH block_avg AS
(
    SELECT block_no,
           AVG(specific_yield) AS avg_yield
    FROM inverter_performance
    GROUP BY block_no
)

SELECT *
FROM block_avg
WHERE avg_yield > 4.95;

-- Percentage Difference from Plant Average
SELECT inverter_id,
       specific_yield,
       ROUND(
           ((specific_yield - 4.95)/4.95)*100,
           2
       ) AS deviation_percent
FROM inverter_performance;

-- Worst 3 Inverters
SELECT inverter_id,
       specific_yield
FROM inverter_performance
ORDER BY specific_yield ASC
LIMIT 3;

