-- Question 8:
-- List all states from state_lookup that are missing from milk_production in 2023.
-- Count how many states are missing milk data for 2023.

-- 8a. States missing milk production data in 2023
SELECT 
    sl.State,
    sl.State_ANSI
FROM state_lookup sl
LEFT JOIN milk_production mp
  ON mp.State_ANSI = sl.State_ANSI
 AND mp.Year = 2023
 AND mp.Geo_Level = 'STATE'
 AND mp.Domain = 'TOTAL'
WHERE mp.State_ANSI IS NULL
ORDER BY sl.State;

-- 8b. Number of states missing milk production data in 2023
SELECT 
    COUNT(*) AS num_states_missing_milk_2023
FROM state_lookup sl
LEFT JOIN milk_production mp
  ON mp.State_ANSI = sl.State_ANSI
 AND mp.Year = 2023
 AND mp.Geo_Level = 'STATE'
 AND mp.Domain = 'TOTAL'
WHERE mp.State_ANSI IS NULL;
