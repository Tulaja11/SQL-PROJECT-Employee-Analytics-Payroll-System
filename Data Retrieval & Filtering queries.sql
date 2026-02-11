-- display data queries
SELECT * FROM employees;

SELECT employee_name, department, salary FROM employees;

SELECT DISTINCT department FROM employees;

-- Filtering
SELECT * FROM employees WHERE department = 'IT';

SELECT * FROM employees WHERE salary > 70000;

SELECT * FROM employees WHERE salary BETWEEN 60000 AND 85000;

SELECT * FROM employees WHERE employee_name LIKE 'A%';

SELECT * FROM employees WHERE department IN ('IT','HR');

-- Sorting and Limit
SELECT * FROM employees ORDER BY salary DESC;

SELECT * FROM employees ORDER BY salary DESC LIMIT 3;

