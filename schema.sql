-- database creation
CREATE DATABASE employee_analytics;
USE employee_analytics;

-- Employee Table with Constraints
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100) NOT NULL,
    dob DATE NOT NULL,
    department VARCHAR(50),
    salary DECIMAL(10,2) CHECK (salary > 0),
    country VARCHAR(50) DEFAULT 'India'
);

-- modifying table structure
ALTER TABLE employees ADD email VARCHAR(100);

ALTER TABLE employees RENAME COLUMN dob TO date_of_birth;

ALTER TABLE employees MODIFY salary DECIMAL(12,2);

ALTER TABLE employees DROP COLUMN email;

-- data insertion
INSERT INTO employees (employee_id, employee_name, date_of_birth, department, salary, country)
VALUES
(101, 'Amit Sharma', '1995-06-15', 'IT', 85000, 'India'),
(102, 'Priya Mehta', '1998-03-22', 'HR', 60000, 'India'),
(103, 'Rahul Verma', '1993-09-10', 'Finance', 95000, 'USA'),
(104, 'Sneha Patil', '1997-12-05', 'IT', 72000, 'India'),
(105, 'Arjun Singh', '1992-07-19', 'Marketing', 68000, NULL),
(106, 'Omkar Jagtap', '1994-09-20', NULL, 67000, NULL);

-- updating data
UPDATE employees
SET salary = salary + 5000
WHERE department = 'IT';

UPDATE employees
SET department = 'Senior HR'
WHERE employee_id = 102;

-- Delete record
DELETE FROM employees WHERE employee_id = 105;

