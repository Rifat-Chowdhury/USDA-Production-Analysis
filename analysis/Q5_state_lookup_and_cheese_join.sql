-- Q5a: List all states and their ANSI codes

SELECT 
    State,
    State_ANSI
FROM state_lookup
ORDER BY State;

-- Q5b: ANSI code for Florida

SELECT 
    State_ANSI
FROM state_lookup
WHERE State = 'FLORIDA';

-- Q5c: All states with their cheese production values for April 2023,
--      including states with no cheese production (LEFT JOIN)

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

-- Q5d: Total cheese production for NEW JERSEY in April 2023

SELECT 
    sl.State,
    SUM(CAST(cp.Value AS BIGINT)) AS total_cheese_production_apr_2023
FROM state_lookup sl
LEFT JOIN cheese_production cp
  ON cp.State_ANSI = sl.State_ANSI
 AND cp.Year = 2023
 AND cp.Period = 'APR'
 AND cp.Geo_Level = 'STATE'
 AND cp.Domain = 'TOTAL'
WHERE sl.State = 'NEW JERSEY'
GROUP BY sl.State;
