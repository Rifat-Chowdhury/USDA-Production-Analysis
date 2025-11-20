-- Question 4:
-- Average honey production for 2022 (across all states)

SELECT AVG (value) AS avg_honey_prod_2022
FROM honey_production hp 
WHERE year = 2022;