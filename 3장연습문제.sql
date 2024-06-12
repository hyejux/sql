SELECT first_name, salary FROM employees WHERE job_id='IT_PROG';

SELECT rpad(substr(lower(first_name),0,3),length(first_name),'*') AS ¿Ã∏ß, 
rpad(salary,10,'*') AS salary FROM employees WHERE job_id='IT_PROG';


SELECT job_id, first_name, salary FROM employees WHERE job_id='IT_PROG';