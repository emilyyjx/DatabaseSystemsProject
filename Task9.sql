-- Add 2 points to the score of each on an assignment 
UPDATE Score
SET score = score + 2
WHERE enrollment_id IN (
    SELECT Enrollment.enrollment_id
    FROM Enrollment
    JOIN Student ON Enrollment.student_id = Student.student_id
);