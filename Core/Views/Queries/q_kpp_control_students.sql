CREATE VIEW q_kpp_control_students AS
SELECT Student.StudentID, REPLACE(Student.Fullname, ' ', ' <--> ') AS Fullname, KPP.Inner_date AS CameIn, KPP.Outer_date CameOut
FROM Student
JOIN KPP
ON Student.id = KPP.Student_id
WHERE strftime('%s', KPP.Inner_date) <= strftime('%s', KPP.Outer_date)