CREATE VIEW sbq_salary_of_instructors AS
SELECT Instructor.Fullname, Course.Code, Course.Name, SUM(Course.Credits) AS Credits, SUM(Course.ECTS) AS ECTS,
CASE
WHEN SUM(Course.Credits) >= 6 THEN '50000$'
WHEN SUM(Course.Credits) = 5 THEN '30000$'
WHEN SUM(Course.Credits) = 4 THEN '25000$'
WHEN SUM(Course.Credits) = 3 THEN '20000$'
WHEN SUM(Course.Credits) = 2 THEN '15000$'
WHEN SUM(Course.Credits) = 1 THEN '10000$'
ELSE '0' 
END AS "Salary (per year)"

FROM Course
JOIN Section, Instructor
ON Course.id = Section.Course_id
AND Section.Instructor_id = Instructor.id
GROUP BY Instructor.Fullname
ORDER BY Credits DESC