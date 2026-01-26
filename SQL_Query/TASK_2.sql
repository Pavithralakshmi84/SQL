Create database Task2
use Task2;



CREATE TABLE Student (
    StudentID INT NOT NULL,
    Name NVARCHAR(50),
    Age INT,
    Course NVARCHAR(50),
    PRIMARY KEY (StudentID)
);

CREATE TABLE Staff (
    StaffID INT NOT NULL,
    Name NVARCHAR(50),
    Department NVARCHAR(50),
    Salary DECIMAL(10,2),
    PRIMARY KEY (StaffID)
);

CREATE TABLE Product (
    ProductID INT NOT NULL,
    ProductName NVARCHAR(50),
    Price DECIMAL(10,2),
    Stock INT,
    PRIMARY KEY (ProductID)
);

CREATE TABLE Customer (
    CustomerID INT NOT NULL,
    Name NVARCHAR(50),
    Email NVARCHAR(100),
    Phone NVARCHAR(15),
    PRIMARY KEY (CustomerID)
);

CREATE TABLE Employee (
    EmployeeID INT NOT NULL,
    Name NVARCHAR(50),
    Position NVARCHAR(50),
    Salary DECIMAL(10,2),
    PRIMARY KEY (EmployeeID)
);

INSERT INTO Student VALUES (1, 'Alice', 20, 'Computer Science');
INSERT INTO Staff VALUES (101, 'John', 'Admin', 35000);
INSERT INTO Product VALUES (201, 'Laptop', 75000, 10);
INSERT INTO Customer VALUES (301, 'David', 'david@email.com', '9876543210');
INSERT INTO Employee VALUES (401, 'Emma', 'Manager', 55000);


SELECT * FROM Student;
SELECT * FROM Staff;
SELECT * FROM Product;
SELECT * FROM Customer;
SELECT * FROM Employee;


UPDATE Student SET Age = 21 WHERE StudentID = 1;
UPDATE Staff SET Salary = 37000 WHERE StaffID = 101;
UPDATE Product SET Stock = 15 WHERE ProductID = 201;
UPDATE Customer SET Phone = '9123456789' WHERE CustomerID = 301;
UPDATE Employee SET Salary = 60000 WHERE EmployeeID = 401;

DELETE FROM Student WHERE StudentID = 1;
DELETE FROM Staff WHERE StaffID = 101;
DELETE FROM Product WHERE ProductID = 201;
DELETE FROM Customer WHERE CustomerID = 301;
DELETE FROM Employee WHERE EmployeeID = 401;


ALTER TABLE Student ADD Address NVARCHAR(100);
ALTER TABLE Staff ADD JoiningDate DATE;
ALTER TABLE Product ADD Category NVARCHAR(50);
ALTER TABLE Customer ADD Address NVARCHAR(100);
ALTER TABLE Employee ADD Department NVARCHAR(50);


-- 7. UNIQUE CONSTRAINTS

ALTER TABLE Student ADD CONSTRAINT UQ_Student_Name UNIQUE (Name);
ALTER TABLE Staff ADD CONSTRAINT UQ_Staff_Name UNIQUE (Name);
ALTER TABLE Product ADD CONSTRAINT UQ_Product_Name UNIQUE (ProductName);
ALTER TABLE Customer ADD CONSTRAINT UQ_Customer_Email UNIQUE (Email);
ALTER TABLE Employee ADD CONSTRAINT UQ_Employee_Name UNIQUE (Name);


-- 8. FOREIGN KEY CONSTRAINTS (Example relationships)

ALTER TABLE Student ADD AdvisorID INT;
ALTER TABLE Student ADD CONSTRAINT FK_Student_Staff FOREIGN KEY (AdvisorID) REFERENCES Staff(StaffID);

ALTER TABLE Customer ADD ProductID INT;
ALTER TABLE Customer ADD CONSTRAINT FK_Customer_Product FOREIGN KEY (ProductID) REFERENCES Product(ProductID);

ALTER TABLE Employee ADD SupervisorID INT;
ALTER TABLE Employee ADD CONSTRAINT FK_Employee_Staff FOREIGN KEY (SupervisorID) REFERENCES Staff(StaffID);


-- 9. DROP CONSTRAINTS 

-- Drop PK
ALTER TABLE Student DROP CONSTRAINT PK__Student__ID;
-- Drop Unique
ALTER TABLE Student DROP CONSTRAINT UQ_Student_Name;
-- Drop FK
ALTER TABLE Student DROP CONSTRAINT FK_Student_Staff;


-- 10. STORED PROCEDURES (CRUD for ALL tables)


-- STUDENT
CREATE PROCEDURE sp_InsertStudent
    @StudentID INT, @Name NVARCHAR(50), @Age INT, @Course NVARCHAR(50)
AS BEGIN
    INSERT INTO Student(StudentID, Name, Age, Course)
    VALUES (@StudentID, @Name, @Age, @Course);
END;

CREATE PROCEDURE sp_UpdateStudent
    @StudentID INT, @Age INT
AS BEGIN
    UPDATE Student SET Age = @Age WHERE StudentID = @StudentID;
END;

CREATE PROCEDURE sp_SelectStudent
AS BEGIN
    SELECT * FROM Student;
END;

CREATE PROCEDURE sp_DeleteStudent
    @StudentID INT
AS BEGIN
    DELETE FROM Student WHERE StudentID = @StudentID;
END;

---------------------------------------------------------
-- STAFF
CREATE PROCEDURE sp_InsertStaff
    @StaffID INT, @Name NVARCHAR(50), @Department NVARCHAR(50), @Salary DECIMAL(10,2)
AS BEGIN
    INSERT INTO Staff VALUES (@StaffID, @Name, @Department, @Salary);
END;

CREATE PROCEDURE sp_UpdateStaff
    @StaffID INT, @Salary DECIMAL(10,2)
AS BEGIN
    UPDATE Staff SET Salary = @Salary WHERE StaffID = @StaffID;
END;

CREATE PROCEDURE sp_SelectStaff
AS BEGIN
    SELECT * FROM Staff;
END;

CREATE PROCEDURE sp_DeleteStaff
    @StaffID INT
AS BEGIN
    DELETE FROM Staff WHERE StaffID = @StaffID;
END;

---------------------------------------------------------
-- PRODUCT
CREATE PROCEDURE sp_InsertProduct
    @ProductID INT, @ProductName NVARCHAR(50), @Price DECIMAL(10,2), @Stock INT
AS BEGIN
    INSERT INTO Product VALUES (@ProductID, @ProductName, @Price, @Stock);
END;

CREATE PROCEDURE sp_UpdateProduct
    @ProductID INT, @Stock INT
AS BEGIN
    UPDATE Product SET Stock = @Stock WHERE ProductID = @ProductID;
END;

CREATE PROCEDURE sp_SelectProduct
AS BEGIN
    SELECT * FROM Product;
END;

CREATE PROCEDURE sp_DeleteProduct
    @ProductID INT
AS BEGIN
    DELETE FROM Product WHERE ProductID = @ProductID;
END;

---------------------------------------------------------
-- CUSTOMER
CREATE PROCEDURE sp_InsertCustomer
    @CustomerID INT, @Name NVARCHAR(50), @Email NVARCHAR(100), @Phone NVARCHAR(15)
AS BEGIN
    INSERT INTO Customer VALUES (@CustomerID, @Name, @Email, @Phone);
END;

CREATE PROCEDURE sp_UpdateCustomer
    @CustomerID INT, @Phone NVARCHAR(15)
AS BEGIN
    UPDATE Customer SET Phone = @Phone WHERE CustomerID = @CustomerID;
END;

CREATE PROCEDURE sp_SelectCustomer
AS BEGIN
    SELECT * FROM Customer;
END;

CREATE PROCEDURE sp_DeleteCustomer
    @CustomerID INT
AS BEGIN
    DELETE FROM Customer WHERE CustomerID = @CustomerID;
END;

---------------------------------------------------------
-- EMPLOYEE
CREATE PROCEDURE sp_InsertEmployee
    @EmployeeID INT, @Name NVARCHAR(50), @Position NVARCHAR(50), @Salary DECIMAL(10,2)
AS BEGIN
    INSERT INTO Employee VALUES (@EmployeeID, @Name, @Position, @Salary);
END;

CREATE PROCEDURE sp_UpdateEmployee
    @EmployeeID INT, @Salary DECIMAL(10,2)
AS BEGIN
    UPDATE Employee SET Salary = @Salary WHERE EmployeeID = @EmployeeID;
END;

CREATE PROCEDURE sp_SelectEmployee
AS BEGIN
    SELECT * FROM Employee;
END;

CREATE PROCEDURE sp_DeleteEmployee
    @EmployeeID INT
AS BEGIN
    DELETE FROM Employee WHERE EmployeeID = @EmployeeID;
END;
