--���� 1.
--EMPLOYEES ���̺��, DEPARTMENTS ���̺��� DEPARTMENT_ID�� ����Ǿ� �ֽ��ϴ�.
--EMPLOYEES, DEPARTMENTS ���̺��� ������� �̿��ؼ� 
--���� INNER , LEFT OUTER, RIGHT OUTER, FULL OUTER ���� �ϼ���. (�޶����� ���� ���� Ȯ��)
--
--
--���� 2.
--EMPLOYEES, DEPARTMENTS ���̺��� INNER JOIN�ϼ���
--����)employee_id�� 200�� ����� �̸�, department_id�� ����ϼ���
--����)�̸� �÷��� first_name�� last_name�� ���ļ� ����մϴ�
--
--���� 3.
--EMPLOYEES, JOBS���̺��� INNER JOIN�ϼ���
--����) ��� ����� �̸��� �������̵�, ���� Ÿ��Ʋ�� ����ϰ�, �̸� �������� �������� ����
--HINT) � �÷����� ���� ����� �ִ��� Ȯ��
--
--���� 4.
--JOBS���̺�� JOB_HISTORY���̺��� LEFT_OUTER JOIN �ϼ���.
--
--���� 5.
--Steven King�� �μ����� ����ϼ���.
--
--���� 6.
--EMPLOYEES ���̺�� DEPARTMENTS ���̺��� Cartesian Product(Cross join)ó���ϼ���
--
--���� 7.
--EMPLOYEES ���̺�� DEPARTMENTS ���̺��� �μ���ȣ�� �����ϰ� SA_MAN ������� �����ȣ, �̸�, 
--�޿�, �μ���, �ٹ����� ����ϼ���. (Alias�� ���)
--
--���� 8.
--employees, jobs ���̺��� ���� �����ϰ� job_title�� 'Stock Manager', 'Stock Clerk'�� ���� ������
--����ϼ���.
--
--���� 9.
--departments ���̺��� ������ ���� �μ��� ã�� ����ϼ���. LEFT OUTER JOIN ���
--
--���� 10. 
--join�� �̿��ؼ� ����� �̸��� �� ����� �Ŵ��� �̸��� ����ϼ���
--��Ʈ) EMPLOYEES ���̺�� EMPLOYEES ���̺��� �����ϼ���.
--
--���� 11. 
--EMPLOYEES ���̺��� left join�Ͽ� ������(�Ŵ���)��, �Ŵ����� �̸�, �Ŵ����� �޿� ���� ����ϼ���
--����) �Ŵ��� ���̵� ���� ����� �����ϰ� �޿��� �������� ����ϼ���
--
--���ʽ� ���� 12.
--���������̽�(William smith)�� ���޵�(�����)�� ���ϼ���.


SELECT * FROM employees;
SELECT * FROM departments;

SELECT  e.employee_id , d.manager_id
FROM employees e, departments d
WHERE e.manager_id = d.manager_id;

SELECT *
FROM employees s
JOIN departments d ON s.manager_id = d.manager_id ;


SELECT *
FROM employees s
INNER JOIN departments d ON s.manager_id = d.manager_id;

SELECT *
FROM employees s
LEFT OUTER JOIN  departments d 
ON s.manager_id = d.manager_id ;

SELECT *
FROM employees s
RIGHT OUTER JOIN  departments d 
ON s.manager_id = d.manager_id;


SELECT *
FROM employees s
FULL OUTER JOIN  departments d 
ON s.manager_id = d.manager_id ;

------------
SELECT e.first_name || ' '||e.last_name AS name, 
                e.employee_id, 
                d.department_id
FROM employees e
JOIN departments d
ON e.department_id = d.department_id
WHERE e.employee_id = 200;


------------
-- job_id
SELECT * FROM  JOBS;

SELECT *
FROM employees e
JOIN jobs j
ON e.job_id = j.job_id;

SELECT e.first_name , e.job_id, j.job_title
FROM employees e
JOIN jobs j
ON e.job_id = j.job_id
ORDER BY e.first_name;


------------
--5
SELECT CONCAT(e.first_name || ' ', e.last_name) , d.department_name
FROM employees e
JOIN departments d
ON e.department_id = d.department_id
WHERE e.first_name = 'Steven' AND e.last_name = 'King';



-----------------
--6

SELECT *
FROM employees e
CROSS JOIN departments d;

-------------------
--7

SELECT e.employee_id, e.first_name, e.salary, d.department_name, d.location_id
FROM employees e
LEFT JOIN departments d
ON e.department_id = d.department_id
LEFT JOIN locations l
ON d.location_id = l.location_id
WHERE e.job_id = 'SA_MAN';
------------------
--8

SELECT *
FROM employees e
JOIN jobs j
ON e.job_id = j.job_id
WHERE job_title = 'Stock Manager' OR job_title = 'Stock Clerk';

------------------
--9

SELECT * FROM employees e 
LEFT JOIN employees e2
ON e.manager_id = e2.manager_id;

------------------
--10

SELECT * FROM employees;

SELECT e.first_name ����̸�, m.first_name �Ŵ����̸�
FROM employees e
JOIN employees m
ON e.manager_id = m.employee_id;


------------------
--11

SELECT e.first_name ���,
        e.manager_id ������, 
        m.first_name �Ŵ����̸�,
        m.salary �Ŵ����޿�
FROM employees e
LEFT JOIN employees m
ON e.manager_id = m.employee_id
WHERE e.manager_id IS NOT NULL
ORDER BY e.salary DESC;  

-----------------------------
--12 
SELECT  e.first_name || '>' ||  e1.first_name  || '>' || e2.first_name ���
FROM employees e
JOIN employees e1
ON e.manager_id = e1.employee_id
JOIN employees e2
On e1.manager_id = e2.employee_id
WHERE e.first_name ='William' AND e.last_name='Smith' ;
