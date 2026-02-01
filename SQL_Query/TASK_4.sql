
CREATE DATABASE CompanyDB;
GO
USE CompanyDB;
GO


CREATE TABLE ProductLog (
    LogID INT IDENTITY(1,1) PRIMARY KEY,
    ProductID INT,
    Action VARCHAR(20),
    ActionDate DATETIME DEFAULT GETDATE()
);

CREATE TABLE Employee (
    EmpID INT IDENTITY(1,1) PRIMARY KEY,
    EmpName VARCHAR(50) NOT NULL,
    Salary INT CHECK (Salary >= 0),  -- 1: Already prevents negative salary
    Dept VARCHAR(50)
);

-- Add Product table 
CREATE TABLE Product (
    ProductID INT IDENTITY(1,1) PRIMARY KEY,
    ProductName VARCHAR(100),
    Price DECIMAL(10,2) CHECK (Price > 0),  -- 5: Prevent invalid price
    Stock INT CHECK (Stock >= 0)
);
GO

-- 2.  #1: Prevent deleting HR employees 
CREATE  tr_PreventHRDelete
ON Employee
FOR DELETE
AS
BEGIN
    SET NOCOUNT ON;
    IF EXISTS (SELECT 1 FROM deleted WHERE Dept = 'HR')
    BEGIN
        RAISERROR('Cannot delete HR employees!', 16, 1);
        ROLLBACK;
        RETURN;
    END
END;
GO

-- 3.  #2: Auto-increase salary by 10% on update (Req #3)
CREATE  tr_AutoSalaryIncrease
ON Employee
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    IF UPDATE(Salary)
    BEGIN
        UPDATE e SET Salary = i.Salary * 1.1
        FROM Employee e INNER JOIN inserted i ON e.EmpID = i.EmpID;
    END
END;
GO

-- 4.  #3: Prevent updating name to NULL (Req #4 - extra safety)
CREATE  tr_PreventNullName
ON Employee
FOR UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    IF EXISTS (SELECT 1 FROM inserted WHERE EmpName IS NULL)
    BEGIN
        RAISERROR('Employee name cannot be NULL!', 16, 1);
        ROLLBACK;
        RETURN;
    END
END;
GO

-- 5.  #4: Prevent deleting products with stock (Req #7)
CREATE  tr_PreventStockDelete
ON Product
FOR DELETE
AS
BEGIN
    SET NOCOUNT ON;
    IF EXISTS (SELECT 1 FROM deleted WHERE Stock > 0)
    BEGIN
        RAISERROR('Cannot delete products with stock!', 16, 1);
        ROLLBACK;
        RETURN;
    END
END;
GO

-- 6.  #5: Auto-reduce stock on Product update (Req #6)
-- Assumes update reduces stock (like sales processing)
CREATE  tr_AutoReduceStock
ON Product
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    -- Log stock reduction if stock decreased
    INSERT INTO ProductLog (ProductID, Action)
    SELECT i.ProductID, 'StockReduced'
    FROM inserted i INNER JOIN deleted d ON i.ProductID = d.ProductID
    WHERE i.Stock < d.Stock;
END;
GO

-- 7. Test Data
INSERT INTO Product VALUES ('Laptop', 50000, 10), ('Mouse', 500, 0);
INSERT INTO Employee (EmpName, Salary, Dept) VALUES 
('Ravi', 30000, 'Sales'),
('Priya', 50000, 'HR'),
('Kumar', 40000, 'IT');




UPDATE Employee SET Salary=35000 WHERE EmpID=1;  -- Salary becomes 38500
DELETE Product WHERE ProductName='Mouse';        -- Stock=0, allowed
SELECT * FROM Employee;
SELECT * FROM Product;
SELECT * FROM ProductLog;
