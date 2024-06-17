SELECT * FROM employees;


SELECT first_name ,salary
FROM employees
WHERE first_name = 'Nancy';

SELECT first_name, salary
FROM  employees
WHERE salary > (SELECT salary FROM employees WHERE first_name = 'Nancy');

SELECT job_id
FROM employees
WHERE employee_id = 103;

SELECT *
FROM employees
WHERE salary > any (SELECT salary FROM employees WHERE FIRST_NAME = 'David');


SELECT *
FROM employees
WHERE job_id = (SELECT job_id
FROM employees
WHERE employee_id = 103);


SELECT first_name, department_name
FROM employees e
LEFT JOIN departments d
ON e.department_id = d.department_id;

SELECT  first_name,
        (SELECT department_name FROM departments d where d.department_id = e.department) AS department_name
FROM EMPLOYEES e;

SELECT first_name,
        job_id, (SELECT job_title FROM jobs j WHERE j.job_id = e.job_id) AS job_title
FROM employees e;

---
SELECT e.first_name,  j.job_id, d.department_name
FROM employees e
LEFT JOIN jobs j ON e.job_id = j.job_id
LEFT JOIN departments d on e.department_id = d.department_id;
-- ���� ǥ��
SELECT first_name,
(SELECT job_title FROM jobs j WHERE j.job_id = e.job_id),
(SELECT departments_name FROM departments d WHERE e.department_id = d.department_id)
FROM employees e;

-- 3�� ����

SELECT rnum, first_name, salary
FROM (SELECT first_name, salary, rownum AS rnum
    FROM (
        SELECT first_name, salary
        FROM employees
        ORDER BY salary desc)
        )
WHERE rnum BETWEEN 11 AND 20;



-- �ټ� ��� 5��°

SELECT first_name, hire_date,
        TRUNC( (SYSDATE - hire_date)/365) AS �ټӳ�� -- ���� ��°�� �ٽ� ��ȸ
FROM employees
ORDER BY �ټӳ�� DESC;

SELECT *
FROM (
SELECT first_name, hire_date,
        TRUNC( (SYSDATE - hire_date)/365) AS �ټӳ�� -- ���� ��°�� �ٽ� ��ȸ
FROM employees
ORDER BY �ټӳ�� DESC)
WHERE �ټӳ�� = 5;




