Create database TASK3;
use TASK3;

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
    INSERT INTO Customer(CustomerID, FirstName, LastName, Email, Phone, City, Address, RegistrationDate)
    VALUES (@CustomerID, @FirstName, @LastName, @Email, @Phone, @City, @Address, @RegistrationDate);
END;

--2️. Retrieve customer details by ID---

CREATE PROCEDURE sp_GetCustomerByID
    @CustomerID INT
AS
BEGIN
    SELECT * FROM Customer WHERE CustomerID = @CustomerID;
END;


---3. Update customer’s email & phone----


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


--5. Delete customer by ID---



CREATE PROCEDURE sp_DeleteCustomer
    @CustomerID INT
AS
BEGIN
    DELETE FROM Customer WHERE CustomerID = @CustomerID;
END;



--- 6 . List customers registered within a date range----


CREATE PROCEDURE sp_GetCustomersByDateRange
    @StartDate DATE,
    @EndDate DATE
AS
BEGIN
    SELECT * FROM Customer
    WHERE RegistrationDate BETWEEN @StartDate AND @EndDate;
END;


--7 . Search customers by partial FirstName or LastName ---- 

CREATE PROCEDURE sp_SearchCustomerByName
    @Name NVARCHAR(50)
AS
BEGIN
    SELECT * FROM Customer
    WHERE FirstName LIKE '%' + @Name + '%'
       OR LastName LIKE '%' + @Name + '%';
END;



--- 8. Update customer’s entire address ---

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


-- 9. Return total number of customers --- 


CREATE PROCEDURE sp_GetTotalCustomers
AS
BEGIN
    SELECT COUNT(*) AS TotalCustomers FROM Customer;
END;


--- 10. Retrieve customers without email---




CREATE PROCEDURE sp_GetCustomersWithoutEmail
AS
BEGIN
    SELECT * FROM Customer WHERE Email IS NULL OR Email = '';
END;


