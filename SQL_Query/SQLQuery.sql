-- 1. CREATE TABLE statements
CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    Name NVARCHAR(50),
    Age INT,
    Course NVARCHAR(50)
);

CREATE TABLE Staff (
    StaffID INT PRIMARY KEY,
    Name NVARCHAR(50),
    Department NVARCHAR(50),
    Salary DECIMAL(10,2)
);

CREATE TABLE Product (
    ProductID INT PRIMARY KEY,
    ProductName NVARCHAR(50),
    Price DECIMAL(10,2),
    Stock INT
);

CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    Name NVARCHAR(50),
    Email NVARCHAR(100),
    Phone NVARCHAR(15)
);

CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    Name NVARCHAR(50),
    Position NVARCHAR(50),
    Salary DECIMAL(10,2)
);

---------------------------------------------------------
-- 2. INSERT statements
INSERT INTO Student VALUES (1, 'Alice', 20, 'Computer Science');
INSERT INTO Staff VALUES (101, 'John', 'Admin', 35000);
INSERT INTO Product VALUES (201, 'Laptop', 75000, 10);
INSERT INTO Customer VALUES (301, 'David', 'david@email.com', '9876543210');
INSERT INTO Employee VALUES (401, 'Emma', 'Manager', 55000);

---------------------------------------------------------
-- 3. SELECT statements
SELECT * FROM Student;
SELECT * FROM Staff;
SELECT * FROM Product;
SELECT * FROM Customer;
SELECT * FROM Employee;

---------------------------------------------------------
-- 4. UPDATE statements
UPDATE Student SET Age = 21 WHERE StudentID = 1;
UPDATE Staff SET Salary = 37000 WHERE StaffID = 101;
UPDATE Product SET Stock = 15 WHERE ProductID = 201;
UPDATE Customer SET Phone = '9123456789' WHERE CustomerID = 301;
UPDATE Employee SET Salary = 60000 WHERE EmployeeID = 401;

---------------------------------------------------------
-- 5. DELETE statements
DELETE FROM Student WHERE StudentID = 1;
DELETE FROM Staff WHERE StaffID = 101;
DELETE FROM Product WHERE ProductID = 201;
DELETE FROM Customer WHERE CustomerID = 301;
DELETE FROM Employee WHERE EmployeeID = 401;

---------------------------------------------------------
-- 6. ALTER TABLE statements
ALTER TABLE Student ADD Address NVARCHAR(100);
ALTER TABLE Staff ADD JoiningDate DATE;
ALTER TABLE Product ADD Category NVARCHAR(50);
ALTER TABLE Customer ADD Address NVARCHAR(100);
ALTER TABLE Employee ADD Department NVARCHAR(50);

---------------------------------------------------------
-- 7. DROP TABLE statements
DROP TABLE Student;
DROP TABLE Staff;
DROP TABLE Product;
DROP TABLE Customer;
DROP TABLE Employee;
