CREATE DATABASE movie1;
USE movie1;


CREATE TABLE movies (
    movie_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100),
    release_year YEAR
);


CREATE TABLE casting (
    casting_id INT PRIMARY KEY AUTO_INCREMENT,
    movie_id INT,
    actor_name VARCHAR(100),
    role VARCHAR(50),
    shooting_date DATE,
    FOREIGN KEY (movie_id) REFERENCES movies(movie_id)
);


CREATE TABLE material (
    material_id INT PRIMARY KEY AUTO_INCREMENT,
    movie_id INT,
    material_name VARCHAR(100),
    quantity INT,
    cost DECIMAL(10,2),
    supplier VARCHAR(100),
    FOREIGN KEY (movie_id) REFERENCES movies(movie_id)
);


CREATE TABLE salary_maintenance (
    salary_id INT PRIMARY KEY AUTO_INCREMENT,
    movie_id INT,
    employee_name VARCHAR(100),
    department VARCHAR(50),
    salary_amount DECIMAL(12,2),
    payment_date DATE,
    status VARCHAR(20),
    FOREIGN KEY (movie_id) REFERENCES movies(movie_id)
);


CREATE TABLE staff_attendance (
    attendance_id INT PRIMARY KEY AUTO_INCREMENT,
    movie_id INT,
    staff_name VARCHAR(100),
    department VARCHAR(50),
    attendance_date DATE,
    status VARCHAR(20),
    hours_worked DECIMAL(4,2),
    FOREIGN KEY (movie_id) REFERENCES movies(movie_id)
);

-- 6. TECHNICIANS with FK to movies
CREATE TABLE technicians (
    technician_id INT PRIMARY KEY AUTO_INCREMENT,
    movie_id INT,
    technician_name VARCHAR(100),
    specialization VARCHAR(50),
    contact_number VARCHAR(15),
    daily_rate DECIMAL(10,2),
    FOREIGN KEY (movie_id) REFERENCES movies(movie_id)
);

-- Insert sample data (5 records each)
INSERT INTO movies (title, release_year) VALUES
('Jailer 2', 2025),('Leo', 2023),('Vikram', 2022),('RRR', 2022),('Masterpiece', 2024);

INSERT INTO casting (movie_id, actor_name, role, shooting_date) VALUES
(1, 'Rajinikanth', 'Hero', '2025-12-01'),
(2, 'Vijay', 'Hero', '2025-11-15'),
(3, 'Kamal Haasan', 'Hero', '2025-10-20'),
(4, 'NTR', 'Hero', '2025-09-10'),
(1, 'Nayanthara', 'Heroine', '2025-12-02');

INSERT INTO material (movie_id, material_name, quantity, cost, supplier) VALUES
(1, 'Camera Equipment', 5, 25000.00, 'Sony India'),
(1, 'Lighting Setup', 10, 15000.00, 'Philips'),
(2, 'Costumes', 50, 50000.00, 'Fabric House'),
(3, 'Props', 20, 8000.00, 'Prop Masters'),
(4, 'Microphone', 15, 12000.00, 'AudioTech');

INSERT INTO salary_maintenance (movie_id, employee_name, department, salary_amount, payment_date, status) VALUES
(1, 'Director Mani', 'Direction', 500000.00, '2025-12-01', 'Paid'),
(1, 'Camera Man Ravi', 'Technical', 60000.00, '2025-12-01', 'Paid'),
(2, 'Sound Engineer Anil', 'Technical', 30000.00, '2025-11-30', 'Paid'),
(3, 'Art Director', 'Art', 45000.00, '2025-12-01', 'Pending'),
(4, 'Makeup Artist', 'Makeup', 35000.00, '2025-12-01', 'Paid');

INSERT INTO staff_attendance (movie_id, staff_name, department, attendance_date, status, hours_worked) VALUES
(1, 'Art Director', 'Art', '2025-12-01', 'Present', 10.5),
(1, 'Makeup Artist', 'Makeup', '2025-12-01', 'Late', 8.0),
(2, 'Production Assistant', 'Production', '2025-12-01', 'Present', 9.0),
(3, 'Costume Designer', 'Costume', '2025-12-02', 'Present', 11.0),
(4, 'Set Designer', 'Art', '2025-12-01', 'Absent', 0.0);

INSERT INTO technicians (movie_id, technician_name, specialization, contact_number, daily_rate) VALUES
(1, 'Ravi Kumar', 'Camera', '9876543210', 3000.00),
(1, 'Suresh Lights', 'Lighting', '9876543211', 2500.00),
(2, 'Anil Sound', 'Sound', '9876543212', 2800.00),
(3, 'Venu Camera', 'Camera', '9876543213', 3200.00),
(4, 'Mani', 'Choreographer', '9876543214', 2200.00);

