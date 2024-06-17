--문제12
--EMPLOYEES테이블, DEPARTMENTS 테이블을 left조인하여, 입사일 오름차순 기준으로 10-20번째 데이터만 출력합니다.
--조건) rownum을 적용하여 번호, 직원아이디, 이름, 입사일, 부서이름 을 출력합니다.
--조건) hire_date를 기준으로 오름차순 정렬 되어야 합니다. rownum이 망가지면 안되요.


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
--문제13
--SA_MAN 사원의 급여 내림차순 기준으로 ROWNUM을 붙여주세요.
--조건) SA_MAN 사원들의 ROWNUM, 이름, 급여, 부서아이디, 부서명을 출력하세요.
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





--문제14
--DEPARTMENTS테이블에서 각 부서의 부서명, 매니저아이디, 부서에 속한 인원수 를 출력하세요.
--조건) 인원수 기준 내림차순 정렬하세요.
--조건) 사람이 없는 부서는 출력하지 뽑지 않습니다.
--한트) 부서의 인원수 먼저 구한다. 이 테이블을 조인한다.





SELECT department_name, rownum RN,
        A.*
FROM (SELECT count(*) 사람
FROM departments ORDER BY 사람 ) A;









--
--문제15
--부서에 모든 컬럼, 주소, 우편번호, 부서별 평균 연봉을 구해서 출력하세요.
--조건) 부서별 평균이 없으면 0으로 출력하세요
--
--문제16
--문제 15결과에 대해 DEPARTMENT_ID기준으로 내림차순 정렬해서 ROWNUM을 붙여 1-10데이터 까지만
--출력하세요