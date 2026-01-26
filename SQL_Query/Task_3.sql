Create database TASK3;
use TASK3;

---------------------------------------------------------
-- 1. CREATE CUSTOMER TABLE
---------------------------------------------------------
CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Email NVARCHAR(100),
    Phone NVARCHAR(15),
    City NVARCHAR(50),
    Address NVARCHAR(200),
    RegistrationDate DATE
);

Select * from Customer;

---------------------------------------------------------
-- 2. STORED PROCEDURES
---------------------------------------------------------

-- Q1: Add a new customer
CREATE PROCEDURE sp_AddCustomer
    @CustomerID INT,
    @FirstName NVARCHAR(50),
    @LastName NVARCHAR(50),
    @Email NVARCHAR(100),
    @Phone NVARCHAR(15),
    @City NVARCHAR(50),
    @Address NVARCHAR(200),
    @RegistrationDate DATE
AS
BEGIN
    INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Phone, City, Address, RegistrationDate)
    VALUES (@CustomerID, @FirstName, @LastName, @Email, @Phone, @City, @Address, @RegistrationDate);
END;
GO

-- Q2: Retrieve customer details by CustomerID
CREATE PROCEDURE sp_GetCustomerByID
    @CustomerID INT
AS
BEGIN
    SELECT * FROM Customer WHERE CustomerID = @CustomerID;
END;
GO

-- Q3: Update customer's email and phone
CREATE PROCEDURE sp_UpdateCustomerContact
    @CustomerID INT,
    @Email NVARCHAR(100),
    @Phone NVARCHAR(15)
AS
BEGIN
    UPDATE Customer
    SET Email = @Email, Phone = @Phone
    WHERE CustomerID = @CustomerID;
END;
GO

-- Q4: Get all customers from a specific city
CREATE PROCEDURE sp_GetCustomersByCity
    @City NVARCHAR(50)
AS
BEGIN
    SELECT * FROM Customer WHERE City = @City;
END;
GO

-- Q5: Delete customer by CustomerID
CREATE PROCEDURE sp_DeleteCustomer
    @CustomerID INT
AS
BEGIN
    DELETE FROM Customer WHERE CustomerID = @CustomerID;
END;
GO

-- Q6: List customers registered within a date range
CREATE PROCEDURE sp_GetCustomersByDateRange
    @StartDate DATE,
    @EndDate DATE
AS
BEGIN
    SELECT * FROM Customer
    WHERE RegistrationDate BETWEEN @StartDate AND @EndDate;
END;
GO

-- Q7: Search customers by partial FirstName or LastName
CREATE PROCEDURE sp_SearchCustomerByName
    @Name NVARCHAR(50)
AS
BEGIN
    SELECT * FROM Customer
    WHERE FirstName LIKE '%' + @Name + '%'
       OR LastName LIKE '%' + @Name + '%';
END;
GO

-- Q8: Update customer's entire address
CREATE PROCEDURE sp_UpdateCustomerAddress
    @CustomerID INT,
    @Address NVARCHAR(200),
    @City NVARCHAR(50)
AS
BEGIN
    UPDATE Customer
    SET Address = @Address, City = @City
    WHERE CustomerID = @CustomerID;
END;
GO

-- Q9: Return total number of customers
CREATE PROCEDURE sp_GetTotalCustomers
AS
BEGIN
    SELECT COUNT(*) AS TotalCustomers FROM Customer;
END;
GO

-- Q10: Retrieve customers without email
CREATE PROCEDURE sp_GetCustomersWithoutEmail
AS
BEGIN
    SELECT * FROM Customer WHERE Email IS NULL OR Email = '';
END;
GO
