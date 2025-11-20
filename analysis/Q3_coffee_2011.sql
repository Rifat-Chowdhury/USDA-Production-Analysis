-- Question 3:
-- Total coffee production for 2011 (all states)

SELECT 
    SUM(value) AS total_coffee_production_2011
FROM coffee_production
WHERE year = 2011;

