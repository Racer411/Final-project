CREATE TABLE "Administrator" (
	"id"	number NOT NULL,
	"Fullname"	varchar2(255) NOT NULL,
	"Email"	varchar2(255) NOT NULL,
	PRIMARY KEY("id")
);

CREATE TABLE "Instructor" (
	"id"	number NOT NULL,
	"Photo"	varchar2(100) NOT NULL,
	"Fullname"	varchar2(255) NOT NULL,
	"Email"	varchar2(254) NOT NULL,
	"Birthdate"	date NOT NULL,
	PRIMARY KEY("id")
);

CREATE TABLE "Advisor" (
	"id"	number NOT NULL,
	"Advisor_id"	number NOT NULL,
	PRIMARY KEY("id"),
	FOREIGN KEY("Advisor_id") REFERENCES "Instructor"("id")
);

CREATE TABLE "Groups" (
	"id"	number NOT NULL,
	"Title"	varchar(255) NOT NULL,
	PRIMARY KEY("id")
);

CREATE TABLE "Advisor_Group" (
	"id"	number NOT NULL,
	"advisor_id"	number NOT NULL,
	"group_id"	number NOT NULL,
	PRIMARY KEY("id"),
	FOREIGN KEY("group_id") REFERENCES "Group"("id"),
	FOREIGN KEY("advisor_id") REFERENCES "Advisor"("id")
);

CREATE TABLE "Attendance_Type" (
	"id"	number NOT NULL,
	"Code"	varchar(255) NOT NULL,
	PRIMARY KEY("id")
);

CREATE TABLE "Employee" (
	"id"	number NOT NULL,
	"Photo"	varchar(100) NOT NULL,
	"Fullname"	varchar(255) NOT NULL,
	"Email"	varchar(254) NOT NULL,
	"Birthdate"	date NOT NULL,
	PRIMARY KEY("id")
);

CREATE TABLE "Department" (
	"id"	number NOT NULL,
	"Code"	varchar(255) NOT NULL,
	"Title"	varchar(255) NOT NULL,
	PRIMARY KEY("id")
);

CREATE TABLE "Department_Employees" (
	"id"	number NOT NULL,
	"department_id"	number NOT NULL,
	"employee_id"	number NOT NULL,
	FOREIGN KEY("department_id") REFERENCES "Department"("id"),
	FOREIGN KEY("employee_id") REFERENCES "Employee"("id"),
	PRIMARY KEY("id")
);

CREATE TABLE "Faculty" (
	"id"	number NOT NULL,
	"Code"	varchar(255) NOT NULL,
	"Title"	varchar(255) NOT NULL,
	"Department_id"	number NOT NULL,
	FOREIGN KEY("Department_id") REFERENCES "Department"("id"),
	PRIMARY KEY("id")
);

CREATE TABLE "Speciality" (
	"id"	number NOT NULL,
	"Code"	varchar(255) NOT NULL,
	"Title"	varchar(255) NOT NULL,
	PRIMARY KEY("id")
);

CREATE TABLE "Section_Type" (
	"id"	number NOT NULL,
	"Name"	varchar(255) NOT NULL,
	PRIMARY KEY("id")
);

CREATE TABLE "Grant_Type" (
	"id"	number NOT NULL,
	"title"	varchar(255) NOT NULL,
	"description"	varchar(255) NOT NULL,
	PRIMARY KEY("id")
);

CREATE TABLE "Room" (
	"id"	number NOT NULL,
	"Code"	varchar(255) NOT NULL,
	PRIMARY KEY("id")
);

CREATE TABLE "Course" (
	"id"	number NOT NULL,
	"Code"	varchar(255) NOT NULL,
	"Name"	varchar(255) NOT NULL,
	"Credits"	number NOT NULL,
	"ECTS"	number NOT NULL,
	PRIMARY KEY("id")
);

CREATE TABLE "Syllabus" (
	"id"	number NOT NULL,
	"File"	varchar(100) NOT NULL,
	PRIMARY KEY("id")
);

CREATE TABLE "Student" (
	"id"	number NOT NULL,
	"Photo"	varchar(100) NOT NULL,
	"StudentID"	varchar(255) NOT NULL,
	"Fullname"	varchar(255) NOT NULL,
	"Birthdate"	date NOT NULL,
	"Email"	varchar(254) NOT NULL,
	"Class"	number NOT NULL,
	"Status"	varchar(255) NOT NULL,
	"Balance"	number NOT NULL,
	"ENT"	number NOT NULL,
	"Faculty_id"	number NOT NULL,
	"Grant_id"	number NOT NULL,
	FOREIGN KEY("Grant_id") REFERENCES "Grant_Type"("id"),
	FOREIGN KEY("Faculty_id") REFERENCES "Faculty"("id"),
	PRIMARY KEY("id")
);

CREATE TABLE "Club" (
	"id"	number NOT NULL,
	"Title"	varchar(255) NOT NULL,
	PRIMARY KEY("id")
);

CREATE TABLE "Section" (
	"id"	number NOT NULL,
	"Code"	varchar(255) NOT NULL,
	"Date"	date NOT NULL,
	"Duration"	number NOT NULL,
	"Course_id"	number NOT NULL,
	"Instructor_id"	number NOT NULL,
	"Room_id"	number NOT NULL,
	"Syllabus_id"	number NOT NULL,
	"Type_id"	number NOT NULL,
	FOREIGN KEY("Type_id") REFERENCES "Section_Type"("id"),
	FOREIGN KEY("Room_id") REFERENCES "Room"("id"),
	FOREIGN KEY("Course_id") REFERENCES "Course"("id"),
	FOREIGN KEY("Syllabus_id") REFERENCES "Syllabus"("id"),
	FOREIGN KEY("Instructor_id") REFERENCES "Instructor"("id"),
	PRIMARY KEY("id")
);

CREATE TABLE "Office_Hour" (
	"id"	number NOT NULL,
	"Date"	date NOT NULL,
	"Duration"	number NOT NULL,
	"Course_id"	number NOT NULL,
	"Instructor_id"	number NOT NULL,
	"Room_id"	number NOT NULL,
	FOREIGN KEY("Instructor_id") REFERENCES "Instructor"("id"),
	FOREIGN KEY("Room_id") REFERENCES "Room"("id"),
	FOREIGN KEY("Course_id") REFERENCES "Course"("id"),
	PRIMARY KEY("id")
);

CREATE TABLE "Course_Curriculum" (
	"id"	integer NOT NULL,
	"Section_id"	number NOT NULL,
	"Student_id"	number NOT NULL,
	FOREIGN KEY("Student_id") REFERENCES "Student"("id"),
	FOREIGN KEY("Section_id") REFERENCES "Section"("id"),
	PRIMARY KEY("id")
);

CREATE TABLE "Attendance" (
	"id"	number NOT NULL,
	"Attendance_id"	number NOT NULL,
	"CourseCurriculum_id"	number NOT NULL,
	FOREIGN KEY("CourseCurriculum_id") REFERENCES "Course_Curriculum"("id"),
	FOREIGN KEY("Attendance_id") REFERENCES "Attendance_Type"("id"),
	PRIMARY KEY("id")
);

CREATE TABLE "Grade" (
	"id"	number NOT NULL,
	"FIN"	number NOT NULL,
	"PF"	number NOT NULL,
	"Total"	number NOT NULL,
	"LetterGrade"	varchar(255) NOT NULL,
	"CourseCurriculum_id"	number NOT NULL,
	FOREIGN KEY("CourseCurriculum_id") REFERENCES "Course_Curriculum"("id"),
	PRIMARY KEY("id")
);

CREATE TABLE "KPP" (
	"id"	number NOT NULL,
	"Inner_date"	timestamp NOT NULL,
	"Outer_date"	timestamp NOT NULL,
	"Student_id"	number NOT NULL,
	FOREIGN KEY("Student_id") REFERENCES "Student"("id"),
	PRIMARY KEY("id")
);