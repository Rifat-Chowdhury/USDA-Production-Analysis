-- Question 10:
-- Find the average coffee production for all years
-- where honey production exceeded 1,000,000 (across all states).

-- 10a. Average coffee production for years where honey > 1 million
SELECT 
    AVG(CAST(c.Value AS BIGINT)) AS avg_coffee_production_for_high_honey_years
FROM coffee_production c
WHERE c.Geo_Level = 'STATE'
  AND c.Year IN (
        SELECT h.Year
        FROM honey_production h
        WHERE h.Geo_Level = 'STATE'
        GROUP BY h.Year
        HAVING SUM(CAST(h.Value AS BIGINT)) > 1000000
    );
