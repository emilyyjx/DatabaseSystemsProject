-- Listing all of the students in a course and all of their scores on every assignment
SELECT Student.first_name, Student.last_name,
Assignment.assignment_name, Score.score
FROM Student, Enrollment, Assignment, Score
WHERE Student.student_id = Enrollment.student_id 
AND Enrollment.enrollment_id = Score.enrollment_id 
AND Assignment.assignment_id = Score.assignment_id
AND Assignment.course_id = (SELECT course_id FROM Course WHERE course_name = 'Introduction to Computer Science');