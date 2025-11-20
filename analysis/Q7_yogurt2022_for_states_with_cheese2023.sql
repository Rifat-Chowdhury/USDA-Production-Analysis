-- Question 7:
-- Total yogurt production for states in the year 2022
-- that also have cheese production data from 2023.
-- This supports cross-commodity analysis for the Dairy Division.

SELECT 
    SUM(y.Value) AS total_yogurt_2022
FROM yogurt_production y
WHERE y.Year = 2022
  AND y.State_ANSI IN (
        SELECT DISTINCT State_ANSI
        FROM cheese_production
        WHERE Year = 2023
          AND Geo_Level = 'STATE'
  );
