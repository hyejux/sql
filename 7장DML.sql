
DESC departments;

--1 ALL

INSERT INTO DEPARTMENTS VALUES(280,'DEVELOPER',NULL,1700);
SELECT * FROM departments;

ROLLBACK;


--2  매칭
INSERT INTO department( department_id, department_name, location_id) VALUES(280,'DEVELOPER',NULL,1700);

ROLLBACK;
-- insert  도 서브쿼리 가능 (많이 사용x 


--3 
SELECT max(department_id) + 10 FROM departments;

INSERT INTO departments(department_ID, department_name) values((select max(department_id) + 10 from departments), 'DEV');





-- 테이블 구조 복사

CREATE TABLE emps AS (SELECT * FROM EMPLOYEES WHERE 1 = 2);

select * from emps;

INSERT INTO EMPS(EMPLOYEE_ID, LAST_NAME, EMAIL, HIRE_DATE, JOB_ID)
(SELECT EMPLOYEE_ID, LAST_NAME, EMAIL, HIRE_DATE, JOB_ID FROM EMPLOYEES WHERE JOB_ID = 'SA_MAN');

COMMIT;

COMMIT;

UPDATE EMPS SET SALARY = 1000, COMMISSION_PCT = 0.1 WHERE EMPLOYEE_ID = 148;

----
UPDATE EMPS SET SALARY = (SELECT SALARY FROM EMPLOYEES WHERE EMPLOYEE_ID = 100) WHERE EMPLOYEE_ID = 148;
--- 2ND

UPDATE EMPS
SET (SALARY , COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) = (SELECT SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID 
FROM employees WHERE EMPLOYEE_ID = 100)
WHERE EMPLOYEE_ID = 148;


--- 3ND
UPDATE EMPS
SET 
SELECT employees_id FROM employees WHERE job_id = 'IT_PROG'; 



