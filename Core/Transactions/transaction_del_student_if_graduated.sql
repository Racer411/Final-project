BEGIN TRANSACTION;

UPDATE Student
SET Status = 'Graduated'
WHERE Class > 4;

DELETE FROM Student
WHERE Student.Status = 'Graduated';

COMMIT;