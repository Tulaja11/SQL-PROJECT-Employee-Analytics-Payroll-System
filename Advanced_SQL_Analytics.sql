-- Aggregate analysis
SELECT COUNT(*) AS total_employees FROM employees;

SELECT MAX(salary) AS highest_salary FROM employees;

SELECT AVG(salary) AS average_salary FROM employees;

SELECT SUM(salary) AS total_payroll FROM employees;

-- Department Wise Analysis
SELECT department,
       COUNT(*) AS emp_count,
       AVG(salary) AS avg_salary,
       SUM(salary) AS total_salary
FROM employees
GROUP BY department;

-- having clause
SELECT department, AVG(salary) AS avg_salary
FROM employees
GROUP BY department
HAVING AVG(salary) > 80000;

-- NULL Handling
SELECT * FROM employees WHERE country IS NULL;

SELECT employee_name,
       IFNULL(country, 'Unknown') AS location
FROM employees;

SELECT employee_name,
       COALESCE(country, department, 'Unknown') AS location
FROM employees;
