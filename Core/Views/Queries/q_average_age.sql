CREATE VIEW q_average_age AS
SELECT Department.Title AS "Department Title", AVG(strftime('%Y', datetime('now')) - strftime('%Y', Employee.Birthdate)) AS "Average Age"
FROM Department
JOIN Employee, Department_Employees
ON Department.id = Department_Employees.department_id
AND Department_Employees.employee_id = Employee.id
GROUP BY Department.Title