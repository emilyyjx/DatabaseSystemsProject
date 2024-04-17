-- Compute Student Grade
SELECT 
    S.student_id,
    S.first_name,
    S.last_name,
    C.course_id,
    C.course_name,
    ROUND(SUM(Score.score / Assignment.max_score * (Category.weight)), 2) AS grade
FROM 
    Student AS S
JOIN 
    Enrollment AS E ON S.student_id = E.student_id
JOIN 
    Course AS C ON E.course_id = C.course_id
JOIN 
    Score ON E.enrollment_id = Score.enrollment_id
JOIN 
    Assignment ON Score.assignment_id = Assignment.assignment_id
JOIN 
    Category ON Assignment.category_id = Category.category_id
GROUP BY 
    S.student_id,
    S.first_name,
    S.last_name,
    C.course_id,
    C.course_name;