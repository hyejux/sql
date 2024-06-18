--����12
--EMPLOYEES���̺�, DEPARTMENTS ���̺��� left�����Ͽ�, �Ի��� �������� �������� 10-20��° �����͸� ����մϴ�.
--����) rownum�� �����Ͽ� ��ȣ, �������̵�, �̸�, �Ի���, �μ��̸� �� ����մϴ�.
--����) hire_date�� �������� �������� ���� �Ǿ�� �մϴ�. rownum�� �������� �ȵǿ�.


/*
SELECT rownum AS RN,
        A.*
    FROM (
        SELECT employee_id
                concat(first_name || ' ' , last_name) AS name,
                hire_date,
                department_name
            FROM employees e
            LEFT JOIN departments d
            ON e.department_id = d.department_id
            ORDER BY hire_date) A
            )
WHERE RN BETWEEN 10 and 20;
*/

SELECT *
FROM (
    SELECT rownum AS RN,
            A.*,
          (SELECT department_name FROM departments d WHERE a.department_Id = d.department_id) AS department_name  
    FROM (
        SELECT employee_id,   concat(first_name || ' ' , last_name) AS name, hire_date, department_id
        FROM employees e
        ORDER BY hire_date
    ) A
)
WHERE RN > 10 AND RN <= 20;


--
--����13
--SA_MAN ����� �޿� �������� �������� ROWNUM�� �ٿ��ּ���.
--����) SA_MAN ������� ROWNUM, �̸�, �޿�, �μ����̵�, �μ����� ����ϼ���.
--

SELECT ROWNUM AS RN,
    A.*,
    D.DEPARTMENT_NAME
FROM (
    SELECT first_name,
            salary,
            department_id
    FROM employees
    WHERE JOB_ID = 'SA_MAN'
    ORDER BY SALARY DESC
) A
LEFT JOIN DEPARTMENTS D
ON A.DEPARTMENT_ID = D.DEPARTMENT_ID;





--����14
--DEPARTMENTS���̺��� �� �μ��� �μ���, �Ŵ������̵�, �μ��� ���� �ο��� �� ����ϼ���.
--����) �ο��� ���� �������� �����ϼ���.
--����) ����� ���� �μ��� ������� ���� �ʽ��ϴ�.
--��Ʈ) �μ��� �ο��� ���� ���Ѵ�. �� ���̺��� �����Ѵ�.


SELECT *
FROM (SELECT COUNT(*) AS �����,
            DEPARTMENT_ID
        FROM EMPLOYEES
        GROUP BY DEPARTMENT_ID) E
LEFT JOIN DEPARTMENTS D
ON d.department_id = E.department_id;

--
--����15
--�μ��� ��� �÷�, �ּ�, �����ȣ, �μ��� ��� ������ ���ؼ� ����ϼ���.
--����) �μ��� ����� ������ 0���� ����ϼ���


-- ���� depart �� 

SELECT D.*, l.street_address, l.postal_code, A.��տ���
FROM departments d
JOIN  (SELECT NVL(TRUNC(AVG(salary)),0) AS ��տ���, department_id
        FROM employees 
        GROUP BY department_id) A
ON d.department_id = A.department_id
LEFT JOIN locations l
on d.location_id = l.location_id;



SELECT AVG(e.salary) FROM employees e
JOIN departments d
ON e.department_id = d.department_id;



SELECT l.street_address , l.postal_code
    FROM (SELECT TRUNC(AVG(salary))
        FROM employees
        GROUP BY department_id);








--
--����16
--���� 15����� ���� DEPARTMENT_ID�������� �������� �����ؼ� ROWNUM�� �ٿ� 1-10������ ������
--����ϼ���

SELECT *
FROM (SELECT rownum RN, department_ID, department_name, manager_id, location_id, postal_code, ��տ���
FROM  (SELECT D.*, l.street_address, l.postal_code, A.��տ���
    FROM departments d
    JOIN  (SELECT NVL(TRUNC(AVG(salary)),0) AS ��տ���, department_id
            FROM employees 
            GROUP BY department_id) A
    ON d.department_id = A.department_id
    LEFT JOIN locations l
    ON d.location_id = l.location_id
    ORDER BY d.department_id DESC))
    C
WHERE RN BETWEEN 1 AND 10;
    





