-- Add an assignment to a course
INSERT INTO Assignment(assignment_id, course_id, category_id, assignment_name, max_score)
VALUES (16,(SELECT course_id FROM Course WHERE course_name = 'Introduction to Computer Science'), 1, 'New Assignment', 100);
