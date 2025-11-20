-- Question 2:
-- States with cheese production greater than 100 million in April 2023
-- Plus the count of qualifying states

-- List of states

SELECT 
    sl.state,
    cp.value AS cheese_production
FROM cheese_production cp
JOIN state_lookup sl 
    ON cp.state_ansi = sl.state_ansi
WHERE cp.year = 2023
  AND cp.period = 'APR'
  AND cp.geo_level = 'STATE'
  AND cp.value > 100000000;
