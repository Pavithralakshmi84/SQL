Create database joins;
use joins;
show databases;

CREATE TABLE customer (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(100) NOT NULL,
    customer_phone VARCHAR(15) UNIQUE NOT NULL
);

USE joins;

SELECT * FROM customer;

INSERT INTO customer (customer_name, customer_phone) VALUES 
('pavithra', '8056148526'),
('Dharani', '4488596332'),
('Balaji', '9917586325'),
('Keerthana', '9914785963');

INSERT INTO customer (customer_name, customer_phone) 
VALUES ('Priya', '9003055896');


USE Joins;
CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100) NOT NULL,
    product_price DECIMAL(10,2) NOT NULL
);

select * from products;

INSERT INTO products (product_name, product_price) VALUES
('iPhone 15 Pro', 119999.00),
('Samsung Galaxy S24', 79999.00),
('MacBook Air M2', 99999.00),
('Sony WH-1000XM5', 29999.00),
('Apple Watch Ultra', 79999.00);

USE Joins;

CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    product_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

select * from orders;



INSERT INTO orders (customer_id, product_id, order_date) VALUES
(1, 1, '2025-12-01'),  
(2, 2, '2025-12-02'),  
(3, 3, '2025-12-03'),   
(4, 4, '2025-12-04'),  
(1, 5, '2025-12-05');  

SHOW TABLES;  
SELECT COUNT(*) FROM customer;   
SELECT COUNT(*) FROM products;
SELECT COUNT(*) FROM orders;  

SELECT 
    c.customer_name, 
    p.product_name, 
    o.order_date
FROM orders o
RIGHT JOIN customer c ON o.customer_id = c.customer_id
LEFT JOIN products p ON o.product_id = p.product_id;


CREATE TABLE students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    student_name VARCHAR(100) NOT NULL
);
INSERT INTO students (student_name) VALUES
('Vani'), ('Kumar'), ('Sathish'), ('Regana'), ('Mercy');
select * from students;

use joins;
CREATE TABLE courses (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(100) NOT NULL,
    teacher VARCHAR(100) NOT NULL
);

INSERT INTO courses (course_name, teacher) VALUES
('Math', 'Merslin Marry'),
('Science', 'Parameshwari'),
('English', 'Alen'),
('History', 'kamalesh'),
('Physics', 'Vani'); 

select * from courses;

CREATE TABLE student_courses (
    student_id INT,
    course_id INT,
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);


SELECT c.customer_name, p.product_name, o.order_date
FROM orders o
INNER JOIN customer c ON o.customer_id = c.customer_id
INNER JOIN products p ON o.product_id = p.product_id;

SELECT p.product_name, p.product_price, COUNT(o.order_id) AS total_orders
FROM products p
INNER JOIN orders o ON p.product_id = o.product_id
GROUP BY p.product_id, p.product_name, p.product_price;


SELECT c.customer_name, o.order_id
FROM customer c
LEFT JOIN orders o ON c.customer_id = o.customer_id;

SELECT p.product_name, o.order_id
FROM products p
LEFT JOIN orders o ON p.product_id = o.product_id;

SELECT o.order_id, c.customer_name
FROM customer c
RIGHT JOIN orders o ON c.customer_id = o.customer_id;


SELECT p.product_name,p.product_price,COUNT(o.order_id) AS total_orders
FROM products p INNER JOIN orders o ON p.product_id = o.product_id
GROUP BY p.product_id, p.product_name, p.product_price;


SELECT o.order_id, p.product_name
FROM products p
RIGHT JOIN orders o ON p.product_id = o.product_id;


SHOW TABLES; 
SELECT COUNT(*) FROM students;  
SELECT COUNT(*) FROM student_courses; 