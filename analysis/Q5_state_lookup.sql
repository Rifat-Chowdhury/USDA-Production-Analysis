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

