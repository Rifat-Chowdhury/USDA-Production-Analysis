-- Question 6:
-- List all states with their cheese production values for April 2023,
-- even if they didn't produce any cheese in April 2023.
-- Also return the total cheese production for NEW JERSEY in April 2023.

-- 6a. All states with their cheese production values (including no production)
SELECT 
    sl.State,
    sl.State_ANSI,
    cp.Value AS cheese_production_apr_2023
FROM state_lookup sl
LEFT JOIN cheese_production cp
  ON cp.State_ANSI = sl.State_ANSI
 AND cp.Year = 2023
 AND cp.Period = 'APR'
 AND cp.Geo_Level = 'STATE'
 AND cp.Domain = 'TOTAL'
ORDER BY sl.State;

-- 6b. Total cheese production for NEW JERSEY in April 2023
SELECT 
    sl.State,
    SUM(cp.Value) AS total_cheese_production_apr_2023
FROM state_lookup sl
LEFT JOIN cheese_production cp
    ON cp.State_ANSI = sl.State_ANSI
    AND cp.Year = 2023
    AND cp.Period = 'APR'
    AND cp.Geo_Level = 'STATE'
    AND cp.Domain = 'TOTAL'
WHERE sl.State = 'NEW JERSEY'
GROUP BY sl.State;

