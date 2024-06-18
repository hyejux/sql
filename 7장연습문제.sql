CREATE TABLE depts (
department_id NUMBER(3) NOT NULL,
department_name varchar2(10) NOT NULL,
manager_id number(3) NULL,
location_id number(4) NOT NULL);

ROLLBACK;






DELETE FROM DEPTS WHERE MANAGER_ID = '301' AND department_name='����';

--------------------- 1


--
DROP TABLE DEPTS;

CREATE TABLE DEPTS AS (SELECT * FROM departments);

INSERT INTO depts values(280,'����',NULL,1800);
INSERT INTO depts values(290,'ȸ���',NULL,1800);
INSERT INTO depts values(300,'����',301,1800);
INSERT INTO depts values(310,'�λ�',302,1800);
INSERT INTO depts values(320,'����',303,1700);

SELECT * FROM DEPTS;
COMMIT;

--
--���� 2.
--DEPTS���̺��� �����͸� �����մϴ�
--1. department_name �� IT Support �� �������� department_name�� IT bank�� ����
--2. department_id�� 290�� �������� manager_id�� 301�� ����

--3. department_name�� IT Helpdesk�� �������� �μ����� IT Help�� , �Ŵ������̵� 303����, �������̵�
--1800���� �����ϼ���

--4. �̻�, ����, ����, �븮 �� �Ŵ������̵� 301�� �ѹ��� �����ϼ���.
SELECT * FROM DEPTS;
SELECT * FROM employees;

UPDATE depts SET department_name = 'IT Support' WHERE department_name='IT bank';


UPDATE depts SET department_id = 290 WHERE manager_id = 301;

UPDATE depts SET department_name = 'IT Help',manager_id = 303, location_id = 1800
WHERE  department_name = 'IT Help';
            

--
--���� 3.
--������ ������ �׻� primary key�� �մϴ�, ���⼭ primary key�� department_id��� �����մϴ�.
--1. �μ��� �����θ� ���� �ϼ���
--2. �μ��� NOC�� �����ϼ���

SELECT * FROM DEPTS;

DELETE FROM depts 
WHERE department_id =
    (SELECT department_id FROM depts WHERE department_name = '����');
    
DELETE FROM depts 
WHERE department_id =
    (SELECT department_id FROM depts WHERE department_name = 'NOC');
    

--����4
--1. Depts �纻���̺��� department_id �� 200���� ū �����͸� ������ ������.
--2. Depts �纻���̺��� manager_id�� null�� �ƴ� �������� manager_id�� ���� 100���� �����ϼ���.
--3. Depts ���̺��� Ÿ�� ���̺� �Դϴ�.
--4. Departments���̺��� �Ź� ������ �Ͼ�� ���̺��̶�� �����ϰ� Depts�� ���Ͽ�
--��ġ�ϴ� ��� Depts�� �μ���, �Ŵ���ID, ����ID�� ������Ʈ �ϰ�, �������Ե� �����ʹ� �״�� �߰����ִ� merge���� �ۼ��ϼ���.\


MERGE INTO DEPTS D1
USING (SELECT * FROM DEPARTMENTS) D2
ON (D1.DEPARTMENT_ID = D2.DEPARTMENT_ID)
WHEN MATCHED THEN
    UPDATE SET D1.DEPARTMENT_NAME = D2.DEPARTMENT_NAME,
                D1.MANAGER_ID = D2.MANAGER_ID,
                D1.LOCATION_ID = D2.LOCATION_ID
WHEN NOT MATCHED THEN
    INSERT VALUES (D2.DEPARTMENT_ID, D2.DEPARTMENT_NAME, D2.MANAGER_ID, D2.LOCATION_ID);
    






--
--���� 5
--1. jobs_it �纻 ���̺��� �����ϼ��� (������ min_salary�� 6000���� ū �����͸� �����մϴ�)

CREATE TABLE JOBS_IR AS (SELECT * FROM JOBS WHERE MIN_SALARY  >6000);
--2. jobs_it ���̺� �Ʒ� �����͸� �߰��ϼ���
--3. obs_it�� Ÿ�� ���̺� �Դϴ�
--jobs���̺��� �Ź� ������ �Ͼ�� ���̺��̶�� �����ϰ� jobs_it�� ���Ͽ�
--min_salary�÷��� 0���� ū ��� ������ �����ʹ� min_salary, max_salary�� ������Ʈ �ϰ� ���� ���Ե�
--�����ʹ� �״�� �߰����ִ� merge���� �ۼ��ϼ���.


MERGE INTO JOBS_IT JI
USING 


