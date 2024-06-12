
SELECT * FROM EMPLOYEES;

-- 특정 컬럼 조회
SELECT FIRST_NAME, HIRE_DATE FROM EMPLOYEES;

SELECT employee_id, first_name, ROWID, ROWNUM FROM employees;


SELECT * FROM EMPLOYEES;

SELECT first_name , job_id FROM employees WHERE first_name = 'David';

SELECT * FROM employees WHERE salary >= 15000;

SELECT * FROM employees WHERE department_id <> 90; --같지 않다

SELECT * FROM employees WHERE hire_date = '06/03/07';
select * from employees where hire_date > '06/03/01';

select * from employees where salary BETWEEN 5000  AND 10000;

SELECT * FROM employees where manager_id IN ( 101,102,103);

SELECT * FROM employees where department_id In (50,60,70);

SELECT * FROM employees where job_id IN ('IT_PROG');

SELECT * FROM employees where (job_id = 'IT_PROG' OR job_id='FI_MGR')
AND salary >= 6000;

SELECT * FROM employees ORDER BY department_id  DESC , salary DESC;



-----------------------------
--연습문제
------------------------------



SELECT * FROM employees;


--1
SELECT employee_id as 사원번호, first_name as 이름, hire_date as 입사일, salary as 급여 FROM employees;
--2
SELECT first_name || ' ' || last_name as name FROM employees;
--3
SELECT * FROM employees where department_id = 50;
--4
SELECT first_name || ' '|| last_name as 이름 , 
department_id as 부서번호 , 
job_id as 직무아이디 
FROM employees where department_id = 50;
--5
SELECT first_name , salary+300 as 인상된급여 FROM employees;
--6
SELECT first_name , salary FROM employees where salary > 10000;

--7 
SELECT first_name , department_id ,commission_pct FROM employees where commission_pct IS NOT NULL;

--8
SELECT first_name , hire_date, salary FROM employees
where hire_date between '03/01/01' AND '03/12/31';

--9
SELECT first_name , hire_date, salary FROM employees
where hire_date LIKE '03%';

--10
SELECT first_name , salary FROM employees ORDER BY salary DESC;


--11
SELECT first_name , salary FROM employees WHERE department_id = 60 ORDER BY salary DESC;


--12
SELECT first_name, job_id FROM employees WHERE job_id='IT_PROG' OR job_id='SA_MAN';


-- 13
SELECT first_name || ' ' || last_name || '사원의 급여는' || salary || '달러 입니다' FROM employees WHERE first_name='Steven' AND last_name ='King';

--14 
SELECT first_name, job_id FROM employees WHERE job_id = 'SA_MAN';

--15
SELECT first_name, job_id FROM employees WHERE job_id = 'SA_MAN';


