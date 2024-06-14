SELECT * FROM employees;

SELECT department_id , AVG(salary) 평균급여, SUM(salary) 급여합
FROM employees
WHERE job_id IS NOT NULL AND hire_date LIKE '05%'
GROUP BY department_id
HAVING AVG(salary) >= 5000
ORDER BY department_id DESC;
-------------------------------------------------------------

-- ROLLUP

SELECT department_id,
        SUM(salary),
        AVG(salary)
FROM employees        
GROUP BY ROLLUP (department_id);


SELECT department_id,
        job_id,
        SUM(salary),
        AVG(salary)
FROM employees
GROUP BY ROLLUP(department_id, job_id)
ORDER BY department_id;




SELECT department_id,
        job_id,
        SUM(salary),
        AVG(salary)
FROM employees
GROUP BY CUBE(department_id, job_id)
ORDER BY department_id;


SELECT DECODE (GROUPING(department_id) , 1, '총계', department_id) AS department_id,
                DECODE(GROUPING (job_id) ,1,'소계',job_id) AS job_id,
                AVG(salary),
                GROUPING (department_id),
                GROUPING(job_id)
FROM employees             
GROUP BY ROLLUP(departement_id, job_id);    




