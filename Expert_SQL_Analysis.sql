-- Access Control
CREATE USER 'hr_user'@'localhost' IDENTIFIED BY 'hr123';

GRANT SELECT ON employee_analytics.employees TO 'hr_user'@'localhost';

REVOKE UPDATE ON employee_analytics.employees FROM 'hr_user'@'localhost';

-- Window functions
-- 1. Rank by Salary
SELECT employee_name,
       salary,
       RANK() OVER (ORDER BY salary DESC) AS salary_rank
FROM employees;

-- 2. Continuous Rank
SELECT 
    employee_name,
    salary,
    DENSE_RANK() OVER (ORDER BY salary DESC) AS continuous_rank
FROM employees;

-- Department Average Without Grouping
SELECT employee_name,
       department,
       salary,
       AVG(salary) OVER (PARTITION BY department) AS dept_avg
FROM employees;

-- Running Total
SELECT employee_id,
       salary,
       SUM(salary) OVER (ORDER BY employee_id) AS running_total
FROM employees;

-- Salary History Table
CREATE TABLE salary_history (
    employee_id INT,
    salary DECIMAL(10,2),
    change_date DATE
);

INSERT INTO salary_history VALUES
(101, 50000, '2023-01-01'),
(101, 60000, '2024-01-01'),
(101, 70000, '2025-01-01'),
(102, 45000, '2023-01-01'),
(102, 55000, '2024-01-01');

-- Previous Salary using LAG
SELECT employee_id,
       salary,
       LAG(salary) OVER (PARTITION BY employee_id ORDER BY change_date) AS previous_salary
FROM salary_history;

-- Employees earning more than department average
SELECT *
FROM employees e
WHERE salary >
(
    SELECT AVG(salary)
    FROM employees
    WHERE department = e.department
);

-- Top Paid Employee in Each Department
SELECT *
FROM (
    SELECT *,
           RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS rnk
    FROM employees
) t
WHERE rnk = 1;


