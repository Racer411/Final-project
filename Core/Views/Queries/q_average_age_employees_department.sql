CREATE VIEW q_average_age_employees_department AS
SELECT Department.Title AS "Department Title", COUNT(Department_Employees.employee_id) AS "Count of employees", AVG((strftime('%Y', datetime('now'))) - (strftime('%Y', Employee.Birthdate))) AS "Average Age"
FROM Employee
JOIN Department, Department_Employees
ON Employee.id = Department_Employees.employee_id
AND Department_Employees.department_id = Department.id
GROUP BY Department.Title