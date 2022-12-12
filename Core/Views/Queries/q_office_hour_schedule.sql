CREATE VIEW q_office_hour_schedule AS
SELECT Course.Code AS "Cource CODE", Course.Name AS "Course Name", Instructor.Fullname AS "Instructor Name", Office_Hour.Date, (REPLACE((ROUND(Office_Hour.Duration / 10, 1) * 10), '.0', '')) AS "Duration (minute)", Room.Code AS "Room CODE"
FROM Course
JOIN Instructor, Office_Hour, Room
ON Course.id = Office_Hour.Course_id
AND Office_Hour.Instructor_id = Instructor.id
AND Instructor.id = Office_Hour.Instructor_id
AND Office_Hour.Room_id = Room.id
ORDER BY Office_Hour.Date ASC