CREATE VIEW q_tourniquet_gate AS
SELECT Student.StudentID AS "User ID", Student.Fullname AS "Name Surname", KPP.Inner_date AS "Date", 
(SELECT
CASE CAST (strftime('%w', KPP.Inner_date) AS INTEGER)
	WHEN 0 THEN 'Sunday'
	WHEN 1 THEN 'Monday'
	WHEN 2 THEN 'Tuesday'
	WHEN 3 THEN 'Wednesday'
	WHEN 4 THEN 'Thursday'
	WHEN 5 THEN 'Friday'
	ELSE 'Saturday'
END AS "Day") AS "Day", KPP.Outer_date AS "Out", (strftime('%d', KPP.Outer_date) - strftime('%d', KPP.Inner_date)) AS Duration
FROM Student
JOIN KPP
ON Student.id = KPP.Student_id
WHERE Duration >= 0
AND ((strftime('%m', KPP.Outer_date) - strftime('%m', KPP.Inner_date))) = 0