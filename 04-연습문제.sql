--문제 1.
--사원 테이블에서 JOB_ID별 사원 수를 구하세요.
--사원 테이블에서 JOB_ID별 월급의 평균을 구하세요. 월급의 평균 순으로 내림차순 정렬하세요.
--시원 테이블에서 JOB_ID별 가장 빠른 입사일을 구하세요. JOB_ID로 내림차순 정렬하세요.


SELECT  JOB_ID, 
        COUNT(*), 
        AVG(salary) AS 평균    
FROM employees 
group by JOB_ID
ORDER BY 평균 DESC;


SELECT  JOB_ID, 
        MIN(hire_date) AS 입사일
FROM employees 
group by JOB_ID
ORDER BY 입사일;


--문제 2.
--사원 테이블에서 입사 년도 별 사원 수를 구하세요.

SELECT TO_CHAR(hire_date,'YYYY'), COUNT(*) AS 사원수
FROM employees
GROUP BY ROLLUP (TO_CHAR(hire_date,'YYYY'));


--문제 3.
--급여가 1000 이상인 사원들의 부서별 평균 급여를 출력하세요. 단 부서 평균 급여가 2000이상인 부서만 출력

SELECT department_id, TRUNC(AVG(salary)) AS 평균급여
FROM employees
WHERE salary >= 1000
HAVING AVG(salary) >= 2000
GROUP BY department_id;

--문제 4.
--사원 테이블에서 commission_pct(커미션) 컬럼이 null이 아닌 사람들의
--department_id(부서별) salary(월급)의 평균, 합계, count를 구합니다.
--조건 1) 월급의 평균은 커미션을 적용시킨 월급입니다.
--조건 2) 평균은 소수 2째 자리에서 절삭 하세요.



SELECT department_id,
        TRUNC(AVG(salary + salary *commission_pct),2) AS 평균급여,
        SUM(salary) AS 합계,
        count(*) AS 인원수
FROM employees
WHERE commission_pct IS NOT NULL
GROUP BY department_id;


--문제 5.
--부서아이디가 NULL이 아니고, 입사일은 05년도 인 사람들의 부서 급여평균과, 급여합계를 평균기준 내림차순합니다
--조건) 평균이 10000이상인 데이터만


SELECT department_id,
        AVG(salary) AS 급여평균,
        SUM(salary) AS 급여합계
FROM employees
WHERE TO_CHAR(hire_date, 'YY') LIKE '05' AND department_id IS NOT NULL
HAVING SUM(salary) >= 10000
GROUP BY department_id
ORDER BY SUM(salary) DESC;


--문제 6.
--직업별 월급합, 총합계를 출력하세요

SELECT  DECODE ( GROUPING ( job_id), 1, '합계', job_id),
        AVG(salary) AS 월급합,
        SUM(salary) AS 총합계
FROM employees
GROUP BY ROLLUP (job_id);ㅉ


--문제 7.
--부서별, JOB_ID를 그룹핑 하여 토탈, 합계를 출력하세요.
--GROUPING() 을 이용하여 소계 합계를 표현하세요


SELECT DECODE(GROUPING (department_id) ,1,'합계', department_id),
        DECODE(GROUPING (job_id) ,1,'소계', job_id),
        count(*),
        SUM(salary)
FROM employees
GROUP BY ROLLUP(job_id, department_id)
ORDER BY SUM(salary);





