-- Average score of an assignment
SELECT AVG(score) AS average_score
FROM Score
WHERE assignment_id IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15)
GROUP BY assignment_id;

-- Highest score of an assignment
SELECT MAX(score) AS highest_score
FROM Score
WHERE assignment_id IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15)
GROUP BY assignment_id;

-- Lowest score of an assignment
SELECT MIN(score) AS lowest_score
FROM Score
WHERE assignment_id IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15)
GROUP BY assignment_id;