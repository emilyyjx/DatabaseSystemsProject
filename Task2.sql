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