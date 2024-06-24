SELECT * FROM departments;


SELECT e.employee_id, d.department_id, d.department_name, e.first_name
FROM employees e
LEFT JOIN departments d
ON d.department_id = e.department_id
WHERE e.employee_id = 202;
