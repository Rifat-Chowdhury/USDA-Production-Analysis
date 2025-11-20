-- Question 9:
-- List all states with their cheese production values for April 2023,
-- including states that did not produce any cheese.
-- Determine whether Delaware produced any cheese in April 2023.

-- 9a. All states with their cheese production values (including states with no production)
SELECT 
    sl.State,
    sl.State_ANSI,
    CAST(cp.Value AS BIGINT) AS cheese_production_apr_2023
FROM state_lookup sl
LEFT JOIN cheese_production cp
  ON cp.State_ANSI = sl.State_ANSI
 AND cp.Year = 2023
 AND cp.Period = 'APR'
 AND cp.Geo_Level = 'STATE'
 AND cp.Domain = 'TOTAL'
ORDER BY sl.State;

-- 9b. Did Delaware produce any cheese in April 2023?
SELECT 
    sl.State,
    CAST(cp.Value AS BIGINT) AS cheese_production_apr_2023
FROM state_lookup sl
LEFT JOIN cheese_production cp
  ON cp.State_ANSI = sl.State_ANSI
 AND cp.Year = 2023
 AND cp.Period = 'APR'
 AND cp.Geo_Level = 'STATE'
 AND cp.Domain = 'TOTAL'
WHERE sl.State = 'DELAWARE';
