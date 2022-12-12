CREATE VIEW sbq_prices_of_students_for_semester AS
SELECT Student.StudentID, Student.Fullname, Student.Email, COUNT(Course.id) AS Count_OF_Courses, (SUM(Course.Credits) * COUNT(Course.id)) AS Total_Credits, (SUM(Course.ECTS) * COUNT(Course.id)) AS Total_ECTS, 
(SELECT (COUNT(Course.id) * SUM(Course.Credits) * 22000) || ' KZT' AS Price) AS Price
FROM Student
JOIN Course, Course_Curriculum, Section
ON Student.id = Course_Curriculum.Student_id
AND Course_Curriculum.Section_id = Section.id
AND Section.Course_id = Course.id
GROUP BY Student.StudentID
ORDER BY Total_Credits DESC