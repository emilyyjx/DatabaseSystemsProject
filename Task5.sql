-- Listing all of the students in a given course
SELECT Student.first_name, Student.last_name
FROM Student, Enrollment
WHERE Student.student_id = Enrollment.student_id 
AND Enrollment.course_id = (SELECT course_id FROM Course WHERE course_name = 'Introduction to Computer Science');

SELECT Student.first_name, Student.last_name
FROM Student, Enrollment
WHERE Student.student_id = Enrollment.student_id 
AND Enrollment.course_id = 
  (SELECT course_id FROM Course WHERE course_name = 'Computer Science II');

SELECT Student.first_name, Student.last_name
FROM Student, Enrollment
WHERE Student.student_id = Enrollment.student_id 
AND Enrollment.course_id = 
  (SELECT course_id FROM Course WHERE course_name = 'Computer Science III');
