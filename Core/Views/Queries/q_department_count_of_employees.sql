CREATE VIEW q_department_count_of_employees AS
SELECT Administrator.Fullname AS Header_OF_Department, Administrator.Email, Department.Code AS Department_CODE, Department.Title, COUNT(Department_Employees.employee_id) AS Count_OF_Employees
FROM Administrator
JOIN Department, Department_Employees, Department_Head
ON Administrator.id = Department_Head.administrator_id
AND Department_Head.department_id = Department_Employees.department_id
AND Department_Employees.department_id = Department.id
GROUP BY Department.Title
ORDER BY Count_OF_Employees DESC