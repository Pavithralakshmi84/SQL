CREATE DATABASE emp;
USE emp;

CREATE TABLE Employees (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    empname VARCHAR(50) NOT NULL,
    gmail VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20) UNIQUE,
    department VARCHAR(50) NOT NULL,
    salary DECIMAL(10,2) NOT NULL,
    Hire_date DATE  );

INSERT INTO Employees (empname, gmail, phone, department, salary, Hire_date) 
VALUES  
('Sweatha', 'sweatha@gmail.com', '9876543210', 'Software developer', 75000.00, '2025-11-22'),
('Merlin', 'merlin@gmail.com', '9876543211', 'Marketing', 65000.00,'2025-11-15'),
('Mercy', 'mercy@gmail.com', '9876543212', 'Sales', 70000.00,'2025-11-19'),
('Sneha', 'sneha@gmail.com', '9876543213', 'HR', 60000.00,'2025-11-26'),
('Anni', 'anni@gmail.com', '9876543214', 'Engineering', 80000.00,'2025-11-09'),
('Vinoth', 'vinoth@gmail.com', '5263987415', 'Manager', 100000.00,'2025-10-03');


select * from Employees;


SELECT department, SUM(salary) AS total_salary 
FROM Employees 
GROUP BY department;


SELECT * FROM Employees 
WHERE Hire_date >= DATE_SUB(CURDATE(), INTERVAL 30 DAY);

SELECT empname, salary, ROUND(salary, 2) AS rounded_salary 
FROM Employees;

SELECT empname, LENGTH(empname) AS name_length 
FROM Employees 
WHERE LENGTH(empname) > 5
ORDER BY name_length DESC;

SELECT department, CAST(AVG(salary) AS DECIMAL(10,2)) AS avg_salary
FROM Employees 
GROUP BY department 
HAVING AVG(salary) > 50000;  

SELECT empname, salary AS updated_salary FROM Employees ORDER BY salary DESC;

SELECT empname, salary AS original, salary * 1.10 AS new_salary FROM Employees; 

ALTER TABLE Employees ADD COLUMN Bonus INT DEFAULT 0; 

SELECT employee_id, empname, department, Hire_date, YEAR(Hire_date) AS join_year
FROM Employees 
ORDER BY Hire_date ASC;



