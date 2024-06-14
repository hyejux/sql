--문제 1.
--EMPLOYEES 테이블과, DEPARTMENTS 테이블은 DEPARTMENT_ID로 연결되어 있습니다.
--EMPLOYEES, DEPARTMENTS 테이블을 엘리어스를 이용해서 
--각각 INNER , LEFT OUTER, RIGHT OUTER, FULL OUTER 조인 하세요. (달라지는 행의 개수 확인)
--
--
--문제 2.
--EMPLOYEES, DEPARTMENTS 테이블을 INNER JOIN하세요
--조건)employee_id가 200인 사람의 이름, department_id를 출력하세요
--조건)이름 컬럼은 first_name과 last_name을 합쳐서 출력합니다
--
--문제 3.
--EMPLOYEES, JOBS테이블을 INNER JOIN하세요
--조건) 모든 사원의 이름과 직무아이디, 직무 타이틀을 출력하고, 이름 기준으로 오름차순 정렬
--HINT) 어떤 컬럼으로 서로 연결되 있는지 확인
--
--문제 4.
--JOBS테이블과 JOB_HISTORY테이블을 LEFT_OUTER JOIN 하세요.
--
--문제 5.
--Steven King의 부서명을 출력하세요.
--
--문제 6.
--EMPLOYEES 테이블과 DEPARTMENTS 테이블을 Cartesian Product(Cross join)처리하세요
--
--문제 7.
--EMPLOYEES 테이블과 DEPARTMENTS 테이블의 부서번호를 조인하고 SA_MAN 사원만의 사원번호, 이름, 
--급여, 부서명, 근무지를 출력하세요. (Alias를 사용)
--
--문제 8.
--employees, jobs 테이블을 조인 지정하고 job_title이 'Stock Manager', 'Stock Clerk'인 직원 정보만
--출력하세요.
--
--문제 9.
--departments 테이블에서 직원이 없는 부서를 찾아 출력하세요. LEFT OUTER JOIN 사용
--
--문제 10. 
--join을 이용해서 사원의 이름과 그 사원의 매니저 이름을 출력하세요
--힌트) EMPLOYEES 테이블과 EMPLOYEES 테이블을 조인하세요.
--
--문제 11. 
--EMPLOYEES 테이블에서 left join하여 관리자(매니저)와, 매니저의 이름, 매니저의 급여 까지 출력하세요
--조건) 매니저 아이디가 없는 사람은 배제하고 급여는 역순으로 출력하세요
--
--보너스 문제 12.
--윌리엄스미스(William smith)의 직급도(상급자)를 구하세요.


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

SELECT e.first_name 사원이름, m.first_name 매니저이름
FROM employees e
JOIN employees m
ON e.manager_id = m.employee_id;


------------------
--11

SELECT e.first_name 사원,
        e.manager_id 관리자, 
        m.first_name 매니저이름,
        m.salary 매니저급여
FROM employees e
LEFT JOIN employees m
ON e.manager_id = m.employee_id
WHERE e.manager_id IS NOT NULL
ORDER BY e.salary DESC;  

-----------------------------
--12 
SELECT  e.first_name || '>' ||  e1.first_name  || '>' || e2.first_name 계급
FROM employees e
JOIN employees e1
ON e.manager_id = e1.employee_id
JOIN employees e2
On e1.manager_id = e2.employee_id
WHERE e.first_name ='William' AND e.last_name='Smith' ;
