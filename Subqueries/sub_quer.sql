create database employees;
use employees;
drop table emp;

CREATE TABLE emp(
emp_id INT PRIMARY KEY AUTO_INCREMENT,
emp_name VARCHAR(30),
emp_dep VARCHAR(30),
salary INT,
job_title VARCHAR(50)
);

INSERT INTO emp (emp_name, emp_dep, salary, job_title) VALUES
('sathish Kumar', 'IT', 65000, 'Software Developer'),
('Deepika', 'HR', 48000, 'HR Executive'),
('Sanjay', 'Finance', 72000, 'Accountant'),
('Kathiravan ', 'IT', 85000, 'Senior Developer'),
('Meena', 'Marketing', 55000, 'Content Strategist'),
('Vignesh', 'Finance', 63000, 'Financial Analyst'),
('Harini ', 'IT', 40000, 'Intern Developer'),
('Ragul', 'Marketing', 70000, 'Digital Marketer'),
('Nisha', 'HR', 52000, 'Recruiter'),
('Praveen ', 'IT', 90000, 'Team Lead'),
('jam', 'IT', 90000, 'Team Lead');
select * from emp;




SELECT emp_dep, COUNT(*) AS total_emp
FROM emp GROUP BY emp_dep HAVING COUNT(*)>10;

SELECT emp_dep,AVG(salary) AS Total_salary
 from emp  GROUP BY emp_dep HAVING AVG(salary)>60000;
 
SELECT job_title AS JOB_TITLE,MAX(salary) AS MAX_SALARY 
FROM emp GROUP BY job_title HAVING MAX(salary)>80000;

SELECT emp_dep, SUM(salary) AS Total_salary
FROM emp GROUP BY emp_dep HAVING SUM(salary) > 500000;

SELECT * FROM emp;

SELECT emp_name, salary, emp_dep FROM emp;

SELECT emp_name AS employee_name, salary AS monthly_salary 
FROM emp;

SELECT * FROM emp where salary > 55000;

SELECT * FROM emp where emp_dep='IT';

SELECT * FROM emp where emp_dep='IT' AND salary >50000;

SELECT * FROM emp where emp_name LIKE 'J%';

SELECT * FROM emp ORDER BY salary desc;

SELECT * FROM emp ORDER BY emp_dep asc,salary desc;

SELECT * FROM emp LIMIT 10;

SELECT * FROM emp LIMIT 10 OFFSET 10;

SELECT DISTINCT emp_dep FROM emp;

SELECT COUNT(DISTINCT emp_dep) AS total_unique_depts FROM emp;

SELECT emp_dep, COUNT(*) AS total_emp
FROM emp GROUP BY emp_dep;


SELECT emp_dep, AVG(salary) AS avg_salary
FROM emp GROUP BY emp_dep;


SELECT emp_dep, SUM(salary) AS total_salary
FROM emp GROUP BY emp_dep;


SELECT emp_dep, MAX(salary) AS max_salary
FROM emp GROUP BY emp_dep;

SELECT emp_dep, job_title, COUNT(*) AS total_emp
FROM emp GROUP BY emp_dep, job_title;

SELECT emp_dep, COUNT(*) AS total_emp
FROM emp GROUP BY emp_dep HAVING COUNT(*) > 5;


SELECT emp_dep, AVG(salary) AS avg_salary
FROM emp GROUP BY emp_dep HAVING AVG(salary) > 50000;


SELECT emp_dep, SUM(salary) AS total_salary
FROM emp GROUP BY emp_dep HAVING SUM(salary) > 500000;


SELECT emp_dep, COUNT(*) AS emp_count, AVG(salary) AS avg_salary
FROM emp GROUP BY emp_dep HAVING COUNT(*) > 5 AND AVG(salary) > 60000;


SELECT emp_dep, MAX(salary) AS max_salary
FROM emp GROUP BY emp_dep HAVING MAX(salary) > 70000;