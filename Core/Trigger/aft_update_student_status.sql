CREATE TRIGGER aft_update_student_status AFTER UPDATE ON Student
BEGIN
	DELETE FROM Student
	WHERE Student.Status = 'Graduated';
END;