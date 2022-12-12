BEGIN TRANSACTION;

UPDATE Attendance_Type
SET Code = 'Attended'
WHERE Code = 1;

UPDATE Attendance_Type
SET Code = 'Absence'
WHERE Code = 2;

UPDATE Attendance_Type
SET Code = 'Permitted'
WHERE Code = 3;

COMMIT;