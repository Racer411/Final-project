CREATE INDEX "Advisor_Advisor_id_d9a71c47" ON "Advisor" (
	"Advisor_id"
);

CREATE INDEX "Advisor_Group_advisor_id_cec5e589" ON "Advisor_Group" (
	"advisor_id"
);

CREATE UNIQUE INDEX "Advisor_Group_advisor_id_group_id_86b1f280_uniq" ON "Advisor_Group" (
	"advisor_id",
	"group_id"
);

CREATE INDEX "Advisor_Group_group_id_fc132fc2" ON "Advisor_Group" (
	"group_id"
);

CREATE INDEX "Attendance_Attendance_id_3f53c2eb" ON "Attendance" (
	"Attendance_id"
);

CREATE INDEX "Attendance_CourseCurriculum_id_6102061c" ON "Attendance" (
	"CourseCurriculum_id"
);

CREATE INDEX "Club_Student_club_id_f19b4fc4" ON "Club_Student" (
	"club_id"
);

CREATE UNIQUE INDEX "Club_Student_club_id_student_id_a976b2c9_uniq" ON "Club_Student" (
	"club_id",
	"student_id"
);

CREATE INDEX "Club_Student_student_id_484bc9db" ON "Club_Student" (
	"student_id"
);

CREATE INDEX "Course_Curriculum_Section_id_610667bf" ON "Course_Curriculum" (
	"Section_id"
);

CREATE INDEX "Course_Curriculum_Student_id_ac7e4a56" ON "Course_Curriculum" (
	"Student_id"
);

CREATE INDEX "Department_Employees_department_id_3b9ad238" ON "Department_Employees" (
	"department_id"
);

CREATE UNIQUE INDEX "Department_Employees_department_id_employee_id_bc235715_uniq" ON "Department_Employees" (
	"department_id",
	"employee_id"
);

CREATE INDEX "Department_Employees_employee_id_e4fcf511" ON "Department_Employees" (
	"employee_id"
);

CREATE INDEX "Department_Head_administrator_id_7d884568" ON "Department_Head" (
	"administrator_id"
);

CREATE INDEX "Department_Head_department_id_23ed41d7" ON "Department_Head" (
	"department_id"
);

CREATE UNIQUE INDEX "Department_Head_department_id_administrator_id_6e5d19ff_uniq" ON "Department_Head" (
	"department_id",
	"administrator_id"
);

CREATE INDEX "Faculty_Department_id_f599619a" ON "Faculty" (
	"Department_id"
);

CREATE INDEX "Grade_CourseCurriculum_id_9904d7c2" ON "Grade" (
	"CourseCurriculum_id"
);

CREATE INDEX "Group_Student_group_id_9cb48e47" ON "Group_Student" (
	"group_id"
);

CREATE UNIQUE INDEX "Group_Student_group_id_student_id_30010e79_uniq" ON "Group_Student" (
	"group_id",
	"student_id"
);

CREATE INDEX "Group_Student_student_id_57a93fbd" ON "Group_Student" (
	"student_id"
);

CREATE INDEX "KPP_Student_id_99e6445e" ON "KPP" (
	"Student_id"
);

CREATE INDEX "Office_Hour_Course_id_9466dee2" ON "Office_Hour" (
	"Course_id"
);

CREATE INDEX "Office_Hour_Instructor_id_af3362e3" ON "Office_Hour" (
	"Instructor_id"
);

CREATE INDEX "Office_Hour_Room_id_a9e74b6c" ON "Office_Hour" (
	"Room_id"
);

CREATE INDEX "Section_Course_id_41ceabe8" ON "Section" (
	"Course_id"
);

CREATE INDEX "Section_Instructor_id_1ab7a38a" ON "Section" (
	"Instructor_id"
);

CREATE INDEX "Section_Room_id_61a451ac" ON "Section" (
	"Room_id"
);

CREATE INDEX "Section_Syllabus_id_a00da06e" ON "Section" (
	"Syllabus_id"
);

CREATE INDEX "Section_Type_id_714ddce2" ON "Section" (
	"Type_id"
);

CREATE INDEX "Student_Faculty_id_ca47ea57" ON "Student" (
	"Faculty_id"
);

CREATE INDEX "Student_Grant_id_31520982" ON "Student" (
	"Grant_id"
);