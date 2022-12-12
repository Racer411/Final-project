CREATE VIEW q_club_students AS
SELECT Student.StudentID, Student.Fullname, Student.Email, Club.Title
FROM Student
JOIN Club_Student, Club
ON Student.id = Club_Student.student_id
AND Club_Student.club_id = Club.id
WHERE Club.id IN (12, 27, 43)