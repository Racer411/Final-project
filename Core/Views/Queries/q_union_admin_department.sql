CREATE VIEW q_union_admin_department AS
SELECT Department.Title AS Admin FROM Department
UNION
SELECT Administrator.Fullname FROM Administrator
JOIN Department_Head, Department
ON Administrator.id = Department_Head.administrator_id
AND Department_Head.department_id = Department.id