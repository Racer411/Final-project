CREATE VIEW q_student_info AS
SELECT Student.StudentID AS "Student ID", REPLACE(Student.Fullname, ' ', ' <--> ') AS "Fullname", Faculty.Title AS "Faculty", Grant_Type.description AS "Grant Type", Student.Status
FROM Student
JOIN Faculty, Grant_Type
ON Student.Faculty_id = Faculty.id
AND Faculty.id = Student.Faculty_id
AND Student.Grant_id = Grant_Type.id