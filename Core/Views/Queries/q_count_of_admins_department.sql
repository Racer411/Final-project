CREATE VIEW q_count_of_admins_department AS
SELECT Department.Title AS "Department Title", COUNT(Department_Head.administrator_id) AS "Count of admins"
FROM Administrator
JOIN Department, Department_Head
ON Administrator.id = Department_Head.administrator_id
AND Department_Head.department_id = Department.id
GROUP BY Department.Title