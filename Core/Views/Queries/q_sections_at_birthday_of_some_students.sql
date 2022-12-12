CREATE VIEW q_sections_at_birthday_of_some_students AS
SELECT Section.Code AS Section_CODE, Student.Fullname AS Student, Course.Code AS Course_CODE, Course.Name AS Course_Name, Instructor.Fullname AS Instructor_Fullname, Section.Date, Room.Code AS Room, Section_Type.Name AS Type_OF_Section
FROM Section
JOIN Instructor, Room, Section_Type, Course, Student, Course_Curriculum
ON Course.id = Section.Course_id
AND Section.Instructor_id = Instructor.id
AND Instructor.id = Section.Instructor_id
AND Section.Type_id = Section_Type.id
AND Section_Type.id = Section.Type_id
AND Section.id = Course_Curriculum.Section_id
AND Course_Curriculum.Student_id = Student.id
WHERE strftime('%d', Section.Date) = strftime('%d', Student.Birthdate) AND strftime('%m', Section.Date) = strftime('%m', Student.Birthdate)
GROUP BY Section.Code