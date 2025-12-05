Create Database employee;
use employee;
Create table emp_details(emp_id INT PRIMARY KEY AUTO_INCREMENT,
empname VARCHAR(30),
empcity VARCHAR(20),
department VARCHAR(15),
salary INT);

INSERT INTO emp_details (empname, empcity, department, salary) VALUES
('Ravi Kumar', 'Chennai', 'IT', 85000),
('Priya ', 'Coimbatore', 'IT', 92000),
('Arun', 'Madurai', 'IT', 78000),
('Deepika', 'Chennai', 'IT', 95000),
('Suresh', 'Hyderabad', 'HR', 65000),
('Lakshmi', 'Bengaluru', 'HR', 72000),
('Mani', 'Coimbatore', 'Sales', 55000),
('Balaji', 'Chennai', 'Sales', 60000),
('Sweatha', 'Hyderabad', 'Sales', 58000),
('Pavithra', 'Madurai', 'Finance', 88000),
('Dharani', 'Bengaluru', 'Finance', 91000),
('Vijay', 'Chennai', 'Marketing', 62000);

SELECT * FROM emp_details;



SELECT department, COUNT(*) as total_employees FROM emp_details GROUP BY department; 



SELECT department, AVG(salary) as avg_salary FROM emp_details GROUP BY department; 



SELECT empcity, COUNT(*) as employee_count FROM emp_details GROUP BY empcity; 



SELECT department, MIN(salary) as Low_salary, MAX(salary) as high_salary 
FROM emp_details GROUP BY Department;


SELECT department, SUM(salary) as total_salary_spent FROM emp_details GROUP BY department;



SELECT department, COUNT(*) as total_employees
FROM emp_details 
GROUP BY department 
HAVING COUNT(*) > 2; 



SELECT department, ROUND(AVG(salary), 2) as avg_salary
FROM emp_details 
GROUP BY department 
HAVING AVG(salary) > 50000;



SELECT empcity, COUNT(*) as employee_count
FROM emp_details 
GROUP BY empcity 
HAVING COUNT(*) > 1; 



SELECT department, MAX(salary) as highest_salary
FROM emp_details 
GROUP BY department 
HAVING MAX(salary) > 40000; 


SELECT department, SUM(salary) as total_salary_spent
FROM emp_details 
GROUP BY department 
HAVING SUM(salary) > 30000; 

SELECT department, COUNT(*) as emp_count, MIN(salary) as min_salary
FROM emp_details 
GROUP BY department 
HAVING MIN(salary) > 40000;

SELECT department, ROUND(AVG(salary), 2) as dept_avg
FROM emp_details 
GROUP BY department 
HAVING AVG(salary) > (SELECT AVG(salary) FROM emp_details);

