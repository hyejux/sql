SELECT * FROM auth;

SELECT * FROM info;


SELECT *
FROM info i 
INNER JOIN auth a
        ON i.auth_id = a.auth_id;
        
        


SELECT i.content, a.name
FROM info i 
INNER JOIN auth a
        ON i.auth_id = a.auth_id
        WHERE a.name = '¿”«˝¡÷';
        
        
        
SELECT * FROM  INFO I RIGHT OUTER JOIN AUTH A ON I.AUTH_ID = A.AUTH_ID;

SELECT * FROM AUTH A RIGHT OUTER JOIN INFO I ON A.AUTH_ID = I.AUTH_ID;
        
        
        -------------------------------
        
SELECT * FROM employees;


SELECT * FROM employees e LEFT JOIN departments d ON e.department_id = d.department_id;

SELECT * FROM employees e INNER JOIN departments d ON e.department_id = d.department_id;

SELECT * FROM employees e
LEFT JOIN departments d ON e.department_id = d.department_id
LEFT JOIN locations l ON d.location_id = l.location_id;

SELECT * FROM employees e 
INNER JOIN employees e2
ON e.manager_id = e2.manager_id;


