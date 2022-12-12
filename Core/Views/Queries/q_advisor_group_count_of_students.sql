CREATE VIEW q_advisor_group_count_of_students AS
SELECT Instructor.Fullname, Instructor.Email, Groups.Title, COUNT(Group_Student.student_id) AS Count_OF_Students
FROM Instructor
JOIN Groups, Group_Student, Advisor, Advisor_Group
ON Instructor.id = Advisor.Advisor_id
AND Advisor.id = Advisor_Group.advisor_id
AND Advisor_Group.group_id = Group_Student.group_id
AND Group_Student.id = Groups.id
GROUP BY Groups.Title
ORDER BY Count_OF_Students DESC