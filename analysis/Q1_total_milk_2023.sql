-- Question 1:
-- Total milk production for 2023 (all states, all periods, Domain = TOTAL)

SELECT SUM (value) AS total_milk_2023
FROM milk_production mp 
WHERE Year = '2023'