SELECT * FROM employees;
--
--���� 1.
--�������ڸ� �������� EMPLOYEE���̺��� �Ի�����(hire_date)�� �����ؼ� �ټӳ���� 10�� �̻���
--����� ������ ���� ������ ����� ����ϵ��� ������ �ۼ��� ������. 
--���� 1) �ټӳ���� ���� ��� ������� ����� �������� �մϴ�.

SELECT hire_date FROM employees;

-- 1
SELECT  employee_id AS �����ȣ, 
        first_name || ' ' || last_name AS �����,
        hire_date AS �Ի����� , 
       -- trunc(months_between(SYSDATE,hire_date)/12) AS "�ټӳ��" 
       trunc((SYSDATE - HIRE_DATE) / 365) AS �ټӳ��
FROM employees 
WHERE trunc((SYSDATE - HIRE_DATE) / 365) >= 10
ORDER BY �ټӳ�� DESC;
--
--���� 2.
--EMPLOYEE ���̺��� manager_id�÷��� Ȯ���Ͽ� first_name, manager_id, ������ ����մϴ�.
--100�̶�� �����塯 
--120�̶�� �����塯
--121�̶�� ���븮��
--122��� �����ӡ�
--�������� ������� ���� ����մϴ�.
--���� 1) �μ��� 50�� ������� ������θ� ��ȸ�մϴ�
--���� 2) DECODE�������� ǥ���غ�����.
--���� 3) CASE�������� ǥ���غ�����.

--2 
SELECT first_name AS �̸�,  manager_id  managerID, 
CASE manager_id WHEN 100 THEN '����'
                WHEN 120 THEN '����'
                WHEN 121 THEN '�븮'
                WHEN 122 THEN '����'
        ELSE '���'
END AS ����
FROM employees;

--2 
SELECT first_name AS �̸�,  manager_id  managerID, 
DECODE (manager_id, 100 , '����',
                    120 , '����',
                    121 , '�븮',
                    122 , '����',
                        '���')
AS ���� 
FROM employees WHERE department_id = 50;


--���� 3. 
--EMPLOYEES ���̺��� �̸�, �Ի���, �޿�, ���޴�� �� ����մϴ�.
--����1) HIRE_DATE�� XXXX��XX��XX�� �������� ����ϼ���. 
--����2) �޿��� Ŀ�̼ǰ��� �ۼ�Ʈ�� ������ ���� ����ϰ�, 1300�� ���� ��ȭ�� �ٲ㼭 ����ϼ���.
--����3) ���޴���� 5�� ���� �̷�� ���ϴ�. �ټӳ���� 5�� ������ ���޴������ ����մϴ�.
--����4) �μ��� NULL�� �ƴ� �����͸� ������� ����մϴ�.
-- 3
SELECT CONCAT(first_name || ' ', last_name) AS �̸�, 
        TO_CHAR(hire_date, 'YYYY"��"MM"��"DD"��"') AS �Ի���  , 
        salary + salary * NVL(CMMISSION_PCT, 0),
        TO_CHAR(salary + salary * NVL(CMMISSION_PCT, 0) * 1300,'L999,999,999') AS �޿�,
        TRUNC((SYSDATE - HIRE_DATE) / 365),
        DECODE( MOD((SYSDATE - HIRE_DATE) / 365),5), 0 , '���޴��' , '���޴��ƴ�') AS ���޴��,
FROM employees
WHERE department_id IS NOT NULL;



        -- DECODE (Trunc(MOD((months_between(SYSDATE,hire_date)/12),5)), 0, 'T'
                               -- ,'F')
