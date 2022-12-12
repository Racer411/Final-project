CREATE VIEW sbq_top10_freshmans_with_score_ent AS
SELECT Student.StudentID, Student.Fullname, Student.Email, Student.ENT, Student.Class, 
(SELECT AVG(ENT) FROM Student
WHERE Class = "Freshman"
GROUP BY Class) AS Average FROM Student
WHERE Class = "Freshman"
ORDER BY ENT DESC
LIMIT 10