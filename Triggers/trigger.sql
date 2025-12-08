CREATE DATABASE emp_db;
use emp_db;

CREATE TABLE employees(
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    empname VARCHAR(30),
    empcity VARCHAR(20),
    department VARCHAR(20),
    job_title VARCHAR(30),
    salary INT,
    created_time TIMESTAMP NULL,
    modified_time TIMESTAMP NULL
);

CREATE TABLE employees_log(
    log_id INT PRIMARY KEY AUTO_INCREMENT,
    action_type VARCHAR(40),
    emp_id INT,
    empname VARCHAR(30),
    old_salary INT,
    new_salary INT,
    log_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE employee_stats(
    counter_id INT PRIMARY KEY,
    total_employees INT
);

INSERT INTO employee_stats VALUES (1, 0);


DELIMITER $$
CREATE TRIGGER trg_after_insert_log_employee
AFTER INSERT ON employees
FOR EACH ROW
BEGIN
    INSERT INTO employees_log(action_type, emp_id, empname, new_salary)
    VALUES ('NEW EMPLOYEE', NEW.emp_id, NEW.empname, NEW.salary);
END$$
DELIMITER ;


DELIMITER $$
CREATE TRIGGER trg_before_insert_timestamp
BEFORE INSERT ON employees
FOR EACH ROW
BEGIN
    SET NEW.created_time = CURRENT_TIMESTAMP;
END$$
DELIMITER ;


DELIMITER $$
CREATE TRIGGER trg_before_insert_positive_salary
BEFORE INSERT ON employees
FOR EACH ROW
BEGIN
    IF NEW.salary <= 0 THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Salary must be positive!';
    END IF;
END$$
DELIMITER ;


DELIMITER $$
CREATE TRIGGER trg_after_delete_archive
AFTER DELETE ON employees
FOR EACH ROW
BEGIN
    INSERT INTO employees_log(action_type, emp_id, empname, old_salary)
    VALUES ('EMPLOYEE DELETED', OLD.emp_id, OLD.empname, OLD.salary);
END$$
DELIMITER ;


DELIMITER $$
CREATE TRIGGER trg_after_insert_update_count
AFTER INSERT ON employees
FOR EACH ROW
BEGIN
    UPDATE employee_stats
    SET total_employees = total_employees + 1
    WHERE counter_id = 1;
END$$
DELIMITER ;


DELIMITER $$
CREATE TRIGGER trg_after_delete_decrease_count
AFTER DELETE ON employees
FOR EACH ROW
BEGIN
    UPDATE employee_stats
    SET total_employees = total_employees - 1
    WHERE counter_id = 1;
END$$
DELIMITER ;



DELIMITER $$
CREATE TRIGGER trg_before_insert_uppercase
BEFORE INSERT ON employees
FOR EACH ROW
BEGIN
    SET NEW.empname = UPPER(NEW.empname);
END$$
DELIMITER ;



DELIMITER $$
CREATE TRIGGER trg_before_update_modified_time
BEFORE UPDATE ON employees
FOR EACH ROW
BEGIN
    SET NEW.modified_time = CURRENT_TIMESTAMP;
END$$
DELIMITER ;