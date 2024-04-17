-- Creating dept table
CREATE TABLE Department (
  dept_id INTEGER PRIMARY KEY,
  dept_name VARCHAR(50) NOT NULL
);
-- Creating course table
CREATE TABLE Course (
  course_id INTEGER PRIMARY KEY,
  dept_id INTEGER,
  course_number INTEGER,
  course_name VARCHAR(100) NOT NULL,
  semester VARCHAR(20) NOT NULL,
  year INTEGER NOT NULL,
  FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);
-- Creating category table
CREATE TABLE Category (
  category_id INTEGER PRIMARY KEY,
  category_name VARCHAR(50) NOT NULL,
  weight DECIMAL(5,2) NOT NULL CHECK (weight >= 0 AND weight <= 100)
);
-- Creating assignment table
CREATE TABLE Assignment (
  assignment_id INTEGER PRIMARY KEY,
  course_id INTEGER,
  category_id INTEGER,
  assignment_name VARCHAR(100) NOT NULL,
  max_score DECIMAL(5,2) NOT NULL,
  FOREIGN KEY (course_id) REFERENCES Course(course_id),
  FOREIGN KEY (category_id) REFERENCES Category(category_id)
);
-- Creating student table
CREATE TABLE Student (
  student_id INTEGER PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL
);
-- Creating enrollment table
CREATE TABLE Enrollment (
  enrollment_id INTEGER PRIMARY KEY,
  student_id INTEGER,
  course_id INTEGER,
  FOREIGN KEY (student_id) REFERENCES Student(student_id),
  FOREIGN KEY (course_id) REFERENCES Course(course_id)
);
-- Creating score table
CREATE TABLE Score (
  score_id INTEGER PRIMARY KEY,
  enrollment_id INTEGER,
  assignment_id INTEGER,
  score DECIMAL(5,2) NOT NULL,
  FOREIGN KEY (enrollment_id) REFERENCES Enrollment(enrollment_id),
  FOREIGN KEY (assignment_id) REFERENCES Assignment(assignment_id)
);

-- Inserting into dept table
INSERT INTO Department (dept_id, dept_name) 
  VALUES (1,'Computer Science');
-- Inserting into course table
INSERT INTO Course (course_id, dept_id, course_number, course_name, semester, year) 
VALUES 
  (1, 1, 101, 'Introduction to Computer Science', 'Fall', 2024),
  (2, 1, 102, 'Computer Science II', 'Fall', 2024),
  (3, 1, 103, 'Computer Science III', 'Spring', 2025);
-- Inserting into category table
INSERT INTO Category (category_id, category_name, weight) 
VALUES 
  (1,'Participation', 10.00),
  (2,'Homework', 20.00),
  (3,'Tests', 50.00),
  (4,'Projects', 20.00);
-- Inserting into Student table
INSERT INTO Student (student_id, first_name, last_name)
VALUES 
  (1,'Tim', 'Allen'),
  (2,'John', 'Brown'),
  (3,'Ben', 'Davis'),
  (4,'Maria', 'Hill'),
  (5,'Garry', 'Johnson'),
  (6,'Sally', 'Jones'),
  (7,'Lisa', 'King'),
  (8,'Amy', 'Smith'),
  (9,'Alice', 'Williams'),
  (10,'Tammy', 'Wilson'),
  (11,'Tommy', 'Quinton');
	
-- Inserting into enrollment table
INSERT INTO Enrollment (enrollment_id, student_id, course_id)
VALUES 
  (1,1, 1),
  (2,2,1),
  (3,3,1),
  (4,4,1),
  (5,5,2),
  (6,6,2),
  (7,7,2),
  (8,8,3),
  (9,9,3),
  (10,10,3),
  (11,11,3);
	
-- Inserting into assignment table 
INSERT INTO Assignment (assignment_id, course_id, category_id, assignment_name, max_score)
VALUES
  (1,1, 1, 'Participation', 100),
  (2,1, 2, 'Homework 1', 100),
  (3,1, 3, 'Midterm', 100),
  (4,1, 3, 'Final', 100),
  (5,1, 4, 'Project', 100),
  (6,2, 1, 'Participation', 100),
  (7,2, 2, 'Homework 1', 100),
  (8,2, 3, 'Midterm', 100),
  (9,2, 3, 'Final', 100),
  (10,2, 4, 'Project', 100),
  (11,3, 1, 'Participation', 100),
  (12,3, 2, 'Homework 1', 100),
  (13,3, 3, 'Midterm', 100),
  (14,3, 3, 'Final', 100),
  (15,3, 4, 'Project', 100);

-- Scores for Course 1 (Introduction to Computer Science)
-- Participation scores
INSERT INTO Score (score_id, enrollment_id, assignment_id, score)
VALUES
  -- Tim Allen's participation score
  (1,(SELECT enrollment_id FROM Enrollment WHERE student_id = 1 AND course_id = 1), 
   (SELECT assignment_id FROM Assignment WHERE course_id = 1 AND assignment_name = 'Participation'), 
   85.5),

  -- John Brown's participation score
  (2,(SELECT enrollment_id FROM Enrollment WHERE student_id = 2 AND course_id = 1), 
   (SELECT assignment_id FROM Assignment WHERE course_id = 1 AND assignment_name = 'Participation'), 
   90),

  -- Ben Davis's participation score
  (3,(SELECT enrollment_id FROM Enrollment WHERE student_id = 3 AND course_id = 1), 
   (SELECT assignment_id FROM Assignment WHERE course_id = 1 AND assignment_name = 'Participation'), 
   78.5);

-- Homework 1 scores
INSERT INTO Score (score_id, enrollment_id, assignment_id, score)
VALUES
  -- Tim Allen's Homework 1 score
  (4,(SELECT enrollment_id FROM Enrollment WHERE student_id = 1 AND course_id = 1), 
   (SELECT assignment_id FROM Assignment WHERE course_id = 1 AND assignment_name = 'Homework 1'), 
   92),

  -- John Brown's Homework 1 score
  (5,(SELECT enrollment_id FROM Enrollment WHERE student_id = 2 AND course_id = 1), 
   (SELECT assignment_id FROM Assignment WHERE course_id = 1 AND assignment_name = 'Homework 1'), 
   88),

  -- Ben Davis's Homework 1 score
  (6,(SELECT enrollment_id FROM Enrollment WHERE student_id = 3 AND course_id = 1), 
   (SELECT assignment_id FROM Assignment WHERE course_id = 1 AND assignment_name = 'Homework 1'), 
   95.5);
-- NEW
-- Midterm scores
INSERT INTO Score (score_id, enrollment_id, assignment_id, score)
VALUES
  -- Tim Allen's Midterm score
  (7,(SELECT enrollment_id FROM Enrollment WHERE student_id = 1 AND course_id = 1), 
   (SELECT assignment_id FROM Assignment WHERE course_id = 1 AND assignment_name = 'Midterm'), 
   85),

  -- John Brown's Midterm score
  (8,(SELECT enrollment_id FROM Enrollment WHERE student_id = 2 AND course_id = 1), 
   (SELECT assignment_id FROM Assignment WHERE course_id = 1 AND assignment_name = 'Midterm'), 
   82),

  -- Ben Davis's Midterm score
  (9,(SELECT enrollment_id FROM Enrollment WHERE student_id = 3 AND course_id = 1), 
   (SELECT assignment_id FROM Assignment WHERE course_id = 1 AND assignment_name = 'Midterm'), 
   90);
-- NEW
-- Final scores
INSERT INTO Score (score_id, enrollment_id, assignment_id, score)
VALUES
  -- Tim Allen's Final score
  (10,(SELECT enrollment_id FROM Enrollment WHERE student_id = 1 AND course_id = 1), 
   (SELECT assignment_id FROM Assignment WHERE course_id = 1 AND assignment_name = 'Final'), 
   90),

  -- John Brown's Final score
  (11,(SELECT enrollment_id FROM Enrollment WHERE student_id = 2 AND course_id = 1), 
   (SELECT assignment_id FROM Assignment WHERE course_id = 1 AND assignment_name = 'Final'), 
   85),

  -- Ben Davis's Final score
  (12,(SELECT enrollment_id FROM Enrollment WHERE student_id = 3 AND course_id = 1), 
   (SELECT assignment_id FROM Assignment WHERE course_id = 1 AND assignment_name = 'Final'), 
   92);
-- NEW
-- Project scores
INSERT INTO Score (score_id, enrollment_id, assignment_id, score)
VALUES
  -- Tim Allen's project score
  (13,(SELECT enrollment_id FROM Enrollment WHERE student_id = 1 AND course_id = 1), 
   (SELECT assignment_id FROM Assignment WHERE course_id = 1 AND assignment_name = 'Project'), 
   93),

  -- John Brown's project score
  (14,(SELECT enrollment_id FROM Enrollment WHERE student_id = 2 AND course_id = 1), 
   (SELECT assignment_id FROM Assignment WHERE course_id = 1 AND assignment_name = 'Project'), 
   97),

  -- Ben Davis's project score
  (15,(SELECT enrollment_id FROM Enrollment WHERE student_id = 3 AND course_id = 1), 
   (SELECT assignment_id FROM Assignment WHERE course_id = 1 AND assignment_name = 'Project'), 
   95);

-- Scores for Course 2 (Computer Science II)
-- Participation scores
INSERT INTO Score (score_id, enrollment_id, assignment_id, score)
VALUES
  -- Maria Hill's participation score
  (16,(SELECT enrollment_id FROM Enrollment WHERE student_id = 4 AND course_id = 2), 
   (SELECT assignment_id FROM Assignment WHERE course_id = 2 AND assignment_name = 'Participation'), 
   75),

  -- Garry Johnson's participation score
  (17,(SELECT enrollment_id FROM Enrollment WHERE student_id = 5 AND course_id = 2), 
   (SELECT assignment_id FROM Assignment WHERE course_id = 2 AND assignment_name = 'Participation'), 
   80),

  -- Sally Jones's participation score
  (18,(SELECT enrollment_id FROM Enrollment WHERE student_id = 6 AND course_id = 2), 
   (SELECT assignment_id FROM Assignment WHERE course_id = 2 AND assignment_name = 'Participation'), 
   85);

-- Homework 1 scores
INSERT INTO Score (score_id, enrollment_id, assignment_id, score)
VALUES
  -- Maria Hill's Homework 1 score
  (19,(SELECT enrollment_id FROM Enrollment WHERE student_id = 4 AND course_id = 2), 
   (SELECT assignment_id FROM Assignment WHERE course_id = 2 AND assignment_name = 'Homework 1'), 
   88),

  -- Garry Johnson's Homework 1 score
  (20,(SELECT enrollment_id FROM Enrollment WHERE student_id = 5 AND course_id = 2), 
   (SELECT assignment_id FROM Assignment WHERE course_id = 2 AND assignment_name = 'Homework 1'), 
   90),

  -- Sally Jones's Homework 1 score
  (21,(SELECT enrollment_id FROM Enrollment WHERE student_id = 6 AND course_id = 2), 
   (SELECT assignment_id FROM Assignment WHERE course_id = 2 AND assignment_name = 'Homework 1'), 
   92);
-- NEW
-- Midterm scores
INSERT INTO Score (score_id, enrollment_id, assignment_id, score)
VALUES
  -- Maria Hill's Midterm score
  (22,(SELECT enrollment_id FROM Enrollment WHERE student_id = 4 AND course_id = 2), 
   (SELECT assignment_id FROM Assignment WHERE course_id = 2 AND assignment_name = 'Midterm'), 
   90),

  -- Garry Johnson's Midterm score
  (23,(SELECT enrollment_id FROM Enrollment WHERE student_id = 5 AND course_id = 2), 
   (SELECT assignment_id FROM Assignment WHERE course_id = 2 AND assignment_name = 'Midterm'), 
   86),

  -- Sally Jones's Midterm score
  (24,(SELECT enrollment_id FROM Enrollment WHERE student_id = 6 AND course_id = 2), 
   (SELECT assignment_id FROM Assignment WHERE course_id = 2 AND assignment_name = 'Midterm'), 
   96);
-- NEW
-- Final scores
INSERT INTO Score (score_id, enrollment_id, assignment_id, score)
VALUES
  -- Maria Hill's Final score
  (25,(SELECT enrollment_id FROM Enrollment WHERE student_id = 4 AND course_id = 2), 
   (SELECT assignment_id FROM Assignment WHERE course_id = 2 AND assignment_name = 'Final'), 
   98),

  -- Garry Johnson's Final score
  (26,(SELECT enrollment_id FROM Enrollment WHERE student_id = 5 AND course_id = 2), 
   (SELECT assignment_id FROM Assignment WHERE course_id = 2 AND assignment_name = 'Final'), 
   82),

  -- Sally Jones's Final score
  (27,(SELECT enrollment_id FROM Enrollment WHERE student_id = 6 AND course_id = 2), 
   (SELECT assignment_id FROM Assignment WHERE course_id = 2 AND assignment_name = 'Final'), 
   97);
-- NEW
-- Project scores
INSERT INTO Score (score_id, enrollment_id, assignment_id, score)
VALUES
  -- Maria Hill's Project score
  (28,(SELECT enrollment_id FROM Enrollment WHERE student_id = 4 AND course_id = 2), 
   (SELECT assignment_id FROM Assignment WHERE course_id = 2 AND assignment_name = 'Project'), 
   95),

  -- Garry Johnson's Project score
  (29,(SELECT enrollment_id FROM Enrollment WHERE student_id = 5 AND course_id = 2), 
   (SELECT assignment_id FROM Assignment WHERE course_id = 2 AND assignment_name = 'Project'), 
   80),

  -- Sally Jones's Project score
  (30,(SELECT enrollment_id FROM Enrollment WHERE student_id = 6 AND course_id = 2), 
   (SELECT assignment_id FROM Assignment WHERE course_id = 2 AND assignment_name = 'Project'), 
   95);


-- Scores for Course 3 (Computer Science III)
-- Participation scores
INSERT INTO Score (score_id, enrollment_id, assignment_id, score)
VALUES
  -- Lisa King's participation score
  (31,(SELECT enrollment_id FROM Enrollment WHERE student_id = 7 AND course_id = 3), 
   (SELECT assignment_id FROM Assignment WHERE course_id = 3 AND assignment_name = 'Participation'), 
   85),

  -- Amy Smith's participation score
  (32,(SELECT enrollment_id FROM Enrollment WHERE student_id = 8 AND course_id = 3), 
   (SELECT assignment_id FROM Assignment WHERE course_id = 3 AND assignment_name = 'Participation'), 
   90),

  -- Alice Williams's participation score
  (33,(SELECT enrollment_id FROM Enrollment WHERE student_id = 9 AND course_id = 3), 
   (SELECT assignment_id FROM Assignment WHERE course_id = 3 AND assignment_name = 'Participation'), 
   78);

-- Homework 1 scores
INSERT INTO Score (score_id, enrollment_id, assignment_id, score)
VALUES
  -- Lisa King's Homework 1 score
  (34,(SELECT enrollment_id FROM Enrollment WHERE student_id = 7 AND course_id = 3), 
   (SELECT assignment_id FROM Assignment WHERE course_id = 3 AND assignment_name = 'Homework 1'), 
   90),

  -- Amy Smith's Homework 1 score
  (35,(SELECT enrollment_id FROM Enrollment WHERE student_id = 8 AND course_id = 3), 
   (SELECT assignment_id FROM Assignment WHERE course_id = 3 AND assignment_name = 'Homework 1'), 
   85),

  -- Alice Williams's Homework 1 score
  (36,(SELECT enrollment_id FROM Enrollment WHERE student_id = 9 AND course_id = 3), 
   (SELECT assignment_id FROM Assignment WHERE course_id = 3 AND assignment_name = 'Homework 1'), 
   92);

-- NEW
-- Midterm scores
INSERT INTO Score (score_id, enrollment_id, assignment_id, score)
VALUES
  -- Lisa King's Midterm score
  (37,(SELECT enrollment_id FROM Enrollment WHERE student_id = 7 AND course_id = 3), 
   (SELECT assignment_id FROM Assignment WHERE course_id = 3 AND assignment_name = 'Midterm'), 
   91),

  -- Amy Smith's Midterm score
  (38,(SELECT enrollment_id FROM Enrollment WHERE student_id = 8 AND course_id = 3), 
   (SELECT assignment_id FROM Assignment WHERE course_id = 3 AND assignment_name = 'Midterm'), 
   89),

  -- Alice Williams's Midterm score
  (39,(SELECT enrollment_id FROM Enrollment WHERE student_id = 9 AND course_id = 3), 
   (SELECT assignment_id FROM Assignment WHERE course_id = 3 AND assignment_name = 'Midterm'), 
   98);
-- NEW
-- Final scores
INSERT INTO Score (score_id, enrollment_id, assignment_id, score)
VALUES
  -- Lisa King's Final score
  (40,(SELECT enrollment_id FROM Enrollment WHERE student_id = 7 AND course_id = 3), 
   (SELECT assignment_id FROM Assignment WHERE course_id = 3 AND assignment_name = 'Final'), 
   98),

  -- Amy Smith's Final score
  (41,(SELECT enrollment_id FROM Enrollment WHERE student_id = 8 AND course_id = 3), 
   (SELECT assignment_id FROM Assignment WHERE course_id = 3 AND assignment_name = 'Final'), 
   89),

  -- Alice Williams's Final score
  (42,(SELECT enrollment_id FROM Enrollment WHERE student_id = 9 AND course_id = 3), 
   (SELECT assignment_id FROM Assignment WHERE course_id = 3 AND assignment_name = 'Final'), 
   92);
-- NEW
-- Project scores
INSERT INTO Score (score_id, enrollment_id, assignment_id, score)
VALUES
  -- Lisa King's Project score
  (43,(SELECT enrollment_id FROM Enrollment WHERE student_id = 7 AND course_id = 3), 
   (SELECT assignment_id FROM Assignment WHERE course_id = 3 AND assignment_name = 'Project'), 
   94),

  -- Amy Smith's Project score
  (44,(SELECT enrollment_id FROM Enrollment WHERE student_id = 8 AND course_id = 3), 
   (SELECT assignment_id FROM Assignment WHERE course_id = 3 AND assignment_name = 'Project'), 
   93),

  -- Alice Williams's Project score
  (45,(SELECT enrollment_id FROM Enrollment WHERE student_id = 9 AND course_id = 3), 
   (SELECT assignment_id FROM Assignment WHERE course_id = 3 AND assignment_name = 'Project'), 
   91);

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


-- Listing all of the students in a course and all of their scores on every assignment
SELECT Student.first_name, Student.last_name,
Assignment.assignment_name, Score.score
FROM Student, Enrollment, Assignment, Score
WHERE Student.student_id = Enrollment.student_id 
AND Enrollment.enrollment_id = Score.enrollment_id 
AND Assignment.assignment_id = Score.assignment_id
AND Assignment.course_id = (SELECT course_id FROM Course WHERE course_name = 'Introduction to Computer Science');

-- Add an assignment to a course
INSERT INTO Assignment(assignment_id, course_id, category_id, assignment_name, max_score)
VALUES (16,(SELECT course_id FROM Course WHERE course_name = 'Introduction to Computer Science'), 1, 'New Assignment', 100);

-- Change the perctanges of the categories for a course
UPDATE Category 
SET weight = 40
WHERE category_name = 'Homework';
UPDATE Category 
SET weight = 15
WHERE category_name = 'Projects';
UPDATE Category 
SET weight = 15
WHERE category_name = 'Participation';
UPDATE Category 
SET weight = 30
WHERE category_name = 'Tests';

-- Add 2 points to the score of each on an assignment 
UPDATE Score
SET score = score + 2
WHERE enrollment_id IN (
    SELECT Enrollment.enrollment_id
    FROM Enrollment
    JOIN Student ON Enrollment.student_id = Student.student_id
);

-- Add 2 points to the score of students with 'Q' in their last name
UPDATE Score
SET score = score + 2
WHERE enrollment_id IN (
    SELECT Enrollment.enrollment_id
    FROM Enrollment
    JOIN Student ON Enrollment.student_id = Student.student_id
    WHERE Student.last_name LIKE '%Q%'
);

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
-- Compute Student Grade with lowest asssignment dropped                           
WITH RankedScores AS (
  SELECT
    S.student_id,
    C.course_id,
    A.assignment_id,
    Score.score,
    ROW_NUMBER() OVER (PARTITION BY S.student_id, C.course_id ORDER BY Score.score DESC) AS score_rank
  FROM
    Student AS S
  JOIN
    Enrollment AS E ON S.student_id = E.student_id
  JOIN
    Course AS C ON E.course_id = C.course_id
  JOIN
    Assignment AS A ON C.course_id = A.course_id
  JOIN
    Score ON E.enrollment_id = Score.enrollment_id AND A.assignment_id = Score.assignment_id
)
SELECT
  student_id,
  first_name,
  last_name,
  course_id,
  course_name,
  ROUND(SUM(score / max_score * weight), 2) AS grade
FROM
  (
    SELECT
      R.student_id,
      R.course_id,
      R.assignment_id,
      R.score,
      R.score_rank,
      A.max_score,
      C.weight,
      Co.course_name,
      S.first_name,
      S.last_name
    FROM
      RankedScores AS R
    JOIN
      Assignment AS A ON R.assignment_id = A.assignment_id
    JOIN
      Category AS C ON A.category_id = C.category_id
    JOIN
      Course AS Co ON R.course_id = Co.course_id
    JOIN
      Student AS S ON R.student_id = S.student_id
  ) AS Ranked
WHERE
  score_rank > 1 -- Exclude the lowest score for each student in each course
GROUP BY
  student_id,
  first_name,
  last_name,
  course_id,
  course_name;