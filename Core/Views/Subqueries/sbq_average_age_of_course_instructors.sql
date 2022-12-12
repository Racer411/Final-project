CREATE VIEW sbq_average_age_of_course_instructors AS
SELECT Course.Code AS "Course Code", Course.Name AS "Course Name",
(SELECT
CASE CAST (AVG(strftime('%y', datetime('now')) - strftime('%y', Instructor.Birthdate)) AS Date)
	WHEN Date <= 50 AND Date >= 23 THEN '25 <= x <= 50'
	ELSE 'x < 23'
END AS "AGE 25 - 50") AS "AGE 25 - 50"
FROM Course
JOIN Instructor, Section
ON Course.id = Section.Course_id
AND Section.Instructor_id = Instructor.id
GROUP BY Course.Code