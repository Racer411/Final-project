CREATE VIEW q_advisor_age_views AS
SELECT Instructor.Fullname, strftime('%Y', datetime('now')) - strftime('%Y', Instructor.Birthdate) AS Age
FROM Instructor
JOIN Advisor, Advisor_Group
ON Instructor.id = Advisor_Group.advisor_id
AND Advisor_Group.advisor_id = Advisor.Advisor_id
GROUP BY Instructor.Fullname
ORDER BY Age DESC