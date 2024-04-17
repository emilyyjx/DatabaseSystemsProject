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