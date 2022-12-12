CREATE TRIGGER aft_insert_office_hour AFTER INSERT ON Office_Hour
BEGIN
	DELETE FROM Office_Hour WHERE strftime('%s', datetime(Office_Hour.Date)) < strftime('%s', datetime('now'));
END;