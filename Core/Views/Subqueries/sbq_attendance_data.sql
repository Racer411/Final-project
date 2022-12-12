CREATE VIEW sbq_attendance_data AS
SELECT Student.Fullname AS Student, Section.Code AS Section_CODE, Course.Name AS Course_Name,
(SELECT 
CASE 
WHEN COUNT(Attendance.Attendance_id) = 1 THEN '7%'
WHEN COUNT(Attendance.Attendance_id) = 2 THEN '14%'
WHEN COUNT(Attendance.Attendance_id) = 3 THEN '21%'
WHEN COUNT(Attendance.Attendance_id) = 4 THEN '28%'
WHEN COUNT(Attendance.Attendance_id) >= 5 THEN 'Retake!'
END AS Absence) AS Absence
FROM Student
JOIN Course_Curriculum, Course, Section, Attendance, Attendance_Type
ON Attendance.CourseCurriculum_id = Course_Curriculum.id
AND Course_Curriculum.Student_id = Student.id
AND Student.id = Course_Curriculum.Student_id
AND Course_Curriculum.Section_id = Section.id
AND Section.Course_id = Course.id
WHERE Attendance.Attendance_id = 2
GROUP BY Student.Fullname
ORDER BY Absence DESC