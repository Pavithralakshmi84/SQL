CREATE DATABASE construction;
USE construction;


CREATE TABLE projects (
    project_id INT PRIMARY KEY AUTO_INCREMENT,
    project_name VARCHAR(100),
    location VARCHAR(100),
    start_date DATE,
    budget DECIMAL(12,2)
);

INSERT INTO projects (project_name, location, start_date, budget) VALUES
('Highrise Tower A', 'Chennai', '2025-11-01', 50000000.00),
('Bridge Construction', 'Coimbatore', '2025-10-15', 25000000.00),
('Residential Complex', 'Madurai', '2025-12-01', 35000000.00);

CREATE TABLE staff (
    staff_id INT PRIMARY KEY AUTO_INCREMENT,
    project_id INT,
    staff_name VARCHAR(100),
    department VARCHAR(50),
    role VARCHAR(50),
    hire_date DATE,
    contact_number VARCHAR(15),
    FOREIGN KEY (project_id) REFERENCES projects(project_id)
);

INSERT INTO staff (project_id, staff_name, department, role, hire_date, contact_number) VALUES
(1, 'Ravi Kumar', 'Civil', 'Site Engineer', '2025-11-01', '9876543210'),
(1, 'Priya ', 'Electrical', 'Supervisor', '2025-11-02', '9876543211'),
(2, 'Mani', 'Mechanical', 'Foreman', '2025-10-20', '9876543212'),
(2, 'Lakshmi', 'Civil', 'Surveyor', '2025-10-25', '9876543213'),
(3, 'Arun', 'Architect', 'Designer', '2025-11-28', '9876543214');

CREATE TABLE materials (
    material_id INT PRIMARY KEY AUTO_INCREMENT,
    project_id INT,
    material_name VARCHAR(100),
    quantity INT,
    unit_cost DECIMAL(10,2),
    supplier VARCHAR(100),
    delivery_date DATE,
    FOREIGN KEY (project_id) REFERENCES projects(project_id)
);

INSERT INTO materials (project_id, material_name, quantity, unit_cost, supplier, delivery_date) VALUES
(1, 'Cement Bags', 500, 350.00, 'ACC Cement', '2025-11-10'),
(1, 'Steel Rods (TMT)', 2000, 65.00, 'Tata Steel', '2025-11-15'),
(2, 'Sand Tons', 100, 1200.00, 'Local Supplier', '2025-10-25'),
(3, 'Bricks (1000s)', 50, 8000.00, 'Brick Works', '2025-12-05'),
(2, 'Concrete Mix', 300, 4500.00, 'ReadyMix', '2025-11-01');

CREATE TABLE attendance (
    attendance_id INT PRIMARY KEY AUTO_INCREMENT,
    project_id INT,
    staff_id INT,
    attendance_date DATE,
    status VARCHAR(20),
    hours_worked DECIMAL(4,2),
    FOREIGN KEY (project_id) REFERENCES projects(project_id),
    FOREIGN KEY (staff_id) REFERENCES staff(staff_id)
);

INSERT INTO attendance (project_id, staff_id, attendance_date, status, hours_worked) VALUES
(1, 1, '2025-12-01', 'Present', 10.5),
(1, 2, '2025-12-01', 'Present', 9.0),
(2, 3, '2025-12-01', 'Late', 7.5),
(2, 4, '2025-12-02', 'Present', 11.0),
(3, 5, '2025-12-03', 'Present', 8.5);

CREATE TABLE stock (
    stock_id INT PRIMARY KEY AUTO_INCREMENT,
    project_id INT,
    item_name VARCHAR(100),
    quantity_available INT,
    unit_price DECIMAL(10,2),
    last_updated DATE,
    FOREIGN KEY (project_id) REFERENCES projects(project_id)
);

INSERT INTO stock (project_id, item_name, quantity_available, unit_price, last_updated) VALUES
('Safety Helmets', 50, 250.00, '2025-12-01'),
('Power Drills', 15, 4500.00, '2025-12-01'),
('Welding Machines', 8, 12000.00, '2025-11-30'),
('Measuring Tapes', 25, 150.00, '2025-12-02'),
('Ladders', 12, 3500.00, '2025-12-01');


CREATE TABLE salary (
      project_id INT  PRIMARY KEY AUTO_INCREMENT,
    staff_id INT,
    salary_amount DECIMAL(12,2),
    payment_date DATE,
    status VARCHAR(20),
    FOREIGN KEY (project_id) REFERENCES projects(project_id),
    FOREIGN KEY (staff_id) REFERENCES staff(staff_id)
);

INSERT INTO salary (project_id, staff_id, salary_amount, payment_date, status) VALUES
(1, 75000.00, '2025-12-01', 'Paid'),
(2, 55000.00, '2025-12-01', 'Paid'),
(3, 45000.00, '2025-11-30', 'Paid'),
(4, 40000.00, '2025-12-01', 'Pending'),
(5, 85000.00, '2025-12-05', 'Pending');



INSERT INTO staff (project_id, staff_name, department, role, hire_date, contact_number) 
VALUES (1, 'Suresh M', 'Civil', 'Mason', '2025-12-04', '9876543215');


UPDATE salary 
SET salary_amount = 85000.00, status = 'Paid' 
WHERE staff_id = 1 AND project_id = 1; 


DELETE FROM stock 
WHERE project_id = 2 AND item_name = 'Ladders'; 