CREATE TRIGGER aft_delete_club AFTER DELETE ON Club
BEGIN
	DELETE FROM Club_Student
	WHERE Club_Student.club_id = OLD.id;
END;