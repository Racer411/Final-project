CREATE VIEW sbq_grades_of_students AS
SELECT Student.Fullname, Course.Name AS CourseName, Grade.Total,
CASE
	WHEN Grade.Total >= 95 THEN 'A'
	WHEN Grade.Total >= 90 AND Grade.Total <= 94 THEN 'A-'
	WHEN Grade.Total >= 85 AND Grade.Total <= 89 THEN 'B+'
	WHEN Grade.Total >= 80 AND Grade.Total <= 84 THEN 'B'
	WHEN Grade.Total >= 75 AND Grade.Total <= 79 THEN 'B-'
	WHEN Grade.Total >= 70 AND Grade.Total <= 74 THEN 'C+'
	WHEN Grade.Total >= 65 AND Grade.Total <= 69 THEN 'C'
	WHEN Grade.Total >= 60 AND Grade.Total <= 64 THEN 'C-'
	WHEN Grade.Total >= 55 AND Grade.Total <= 59 THEN 'D+'
	WHEN Grade.Total >= 50 AND Grade.Total <= 54 THEN 'D'
	WHEN Grade.Total >= 25 AND Grade.Total <= 49 THEN 'FX'
	ELSE 'F'
END AS LetterGrade,
(SELECT
CASE
	WHEN Grade.Total >= 95 THEN '4'
	WHEN Grade.Total >= 90 AND Grade.Total <= 94 THEN '3.67'
	WHEN Grade.Total >= 85 AND Grade.Total <= 89 THEN '3.33'
	WHEN Grade.Total >= 80 AND Grade.Total <= 84 THEN '3'
	WHEN Grade.Total >= 75 AND Grade.Total <= 79 THEN '2.67'
	WHEN Grade.Total >= 70 AND Grade.Total <= 74 THEN '2.33'
	WHEN Grade.Total >= 65 AND Grade.Total <= 69 THEN '2'
	WHEN Grade.Total >= 60 AND Grade.Total <= 64 THEN '1.67'
	WHEN Grade.Total >= 55 AND Grade.Total <= 59 THEN '1.33'
	WHEN Grade.Total >= 50 AND Grade.Total <= 54 THEN '1'
	WHEN Grade.Total >= 25 AND Grade.Total <= 49 THEN '0'
	ELSE '0'
END AS InPoints
FROM Grade AS InPoints) AS InPoints,
(SELECT
CASE
	WHEN Grade.Total >= 90 THEN 'Excellent'
	WHEN Grade.Total >= 70 AND Grade.Total <= 89 THEN 'Good'
	WHEN Grade.Total >= 50 AND Grade.Total <= 69 THEN 'Satisfactory'
	WHEN Grade.Total >= 25 AND Grade.Total <= 49 THEN 'Unsatisfactory'
	ELSE '0'
END AS Traditional
FROM Grade AS Traditional) AS Traditional FROM Grade
JOIN Course_Curriculum, Student, Course, Section
ON Course_Curriculum.Section_id = Section.id
AND Section.Course_id = Course.id
AND Course.id = Section.Course_id
AND Section.id = Course_Curriculum.Section_id
AND Course_Curriculum.id = Grade.CourseCurriculum_id
AND Grade.CourseCurriculum_id = Course_Curriculum.id
AND Course_Curriculum.Student_id = Student.id
ORDER BY Grade.Total DESC