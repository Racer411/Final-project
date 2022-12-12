BEGIN TRANSACTION;

UPDATE Student
SET Class = "Sophomore"
WHERE Class = "Freshman"
AND strftime('%Y', datetime('now')) >= "2022"
AND strftime('%d', datetime('now')) >= "25"
AND strftime('%m', datetime('now')) >= "05"

COMMIT;