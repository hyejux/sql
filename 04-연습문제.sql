--���� 1.
--��� ���̺��� JOB_ID�� ��� ���� ���ϼ���.
--��� ���̺��� JOB_ID�� ������ ����� ���ϼ���. ������ ��� ������ �������� �����ϼ���.
--�ÿ� ���̺��� JOB_ID�� ���� ���� �Ի����� ���ϼ���. JOB_ID�� �������� �����ϼ���.


SELECT  JOB_ID, 
        COUNT(*), 
        AVG(salary) AS ���    
FROM employees 
group by JOB_ID
ORDER BY ��� DESC;


SELECT  JOB_ID, 
        MIN(hire_date) AS �Ի���
FROM employees 
group by JOB_ID
ORDER BY �Ի���;


--���� 2.
--��� ���̺��� �Ի� �⵵ �� ��� ���� ���ϼ���.

SELECT TO_CHAR(hire_date,'YYYY'), COUNT(*) AS �����
FROM employees
GROUP BY ROLLUP (TO_CHAR(hire_date,'YYYY'));


--���� 3.
--�޿��� 1000 �̻��� ������� �μ��� ��� �޿��� ����ϼ���. �� �μ� ��� �޿��� 2000�̻��� �μ��� ���

SELECT department_id, TRUNC(AVG(salary)) AS ��ձ޿�
FROM employees
WHERE salary >= 1000
HAVING AVG(salary) >= 2000
GROUP BY department_id;

--���� 4.
--��� ���̺��� commission_pct(Ŀ�̼�) �÷��� null�� �ƴ� �������
--department_id(�μ���) salary(����)�� ���, �հ�, count�� ���մϴ�.
--���� 1) ������ ����� Ŀ�̼��� �����Ų �����Դϴ�.
--���� 2) ����� �Ҽ� 2° �ڸ����� ���� �ϼ���.



SELECT department_id,
        TRUNC(AVG(salary + salary *commission_pct),2) AS ��ձ޿�,
        SUM(salary) AS �հ�,
        count(*) AS �ο���
FROM employees
WHERE commission_pct IS NOT NULL
GROUP BY department_id;


--���� 5.
--�μ����̵� NULL�� �ƴϰ�, �Ի����� 05�⵵ �� ������� �μ� �޿���հ�, �޿��հ踦 ��ձ��� ���������մϴ�
--����) ����� 10000�̻��� �����͸�


SELECT department_id,
        AVG(salary) AS �޿����,
        SUM(salary) AS �޿��հ�
FROM employees
WHERE TO_CHAR(hire_date, 'YY') LIKE '05' AND department_id IS NOT NULL
HAVING SUM(salary) >= 10000
GROUP BY department_id
ORDER BY SUM(salary) DESC;


--���� 6.
--������ ������, ���հ踦 ����ϼ���

SELECT  DECODE ( GROUPING ( job_id), 1, '�հ�', job_id),
        AVG(salary) AS ������,
        SUM(salary) AS ���հ�
FROM employees
GROUP BY ROLLUP (job_id);��


--���� 7.
--�μ���, JOB_ID�� �׷��� �Ͽ� ��Ż, �հ踦 ����ϼ���.
--GROUPING() �� �̿��Ͽ� �Ұ� �հ踦 ǥ���ϼ���


SELECT DECODE(GROUPING (department_id) ,1,'�հ�', department_id),
        DECODE(GROUPING (job_id) ,1,'�Ұ�', job_id),
        count(*),
        SUM(salary)
FROM employees
GROUP BY ROLLUP(job_id, department_id)
ORDER BY SUM(salary);





