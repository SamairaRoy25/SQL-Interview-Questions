create database xyz;

use xyz;

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Price DECIMAL(10, 2)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO Products (ProductID, ProductName, Price)
VALUES
    (1, 'Laptop', 1200.00),
    (2, 'Smartphone', 800.00),
    (3, 'Tablet', 300.00),
    (4, 'Headphones', 100.00),
    (5, 'Monitor', 200.00);


INSERT INTO Orders (OrderID, ProductID, Quantity)
VALUES
    (101, 1, 2),  
    (102, 2, 20),   
    (103, 2, 3),    
    (104, 4, 5), 
    (105, 3, 5),
    (106, 5, 2),
    (107, 4, 5),
    (108, 3, 10);  
    
    
-- Q11. Write a query to find the names of all products that have been ordered more than 5 
-- times across all orders.


-- --------------------------------------------------------------

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(100),
    DepartmentID INT,
    Salary DECIMAL(10, 2)
);

INSERT INTO Employees (EmployeeID, EmployeeName, DepartmentID, Salary)
VALUES
    (1, 'Alice Smith', 101, 60000.00),
    (2, 'Bob Johnson', 102, 75000.00),
    (3, 'Carol Williams', 103, 55000.00),
    (4, 'David Brown', 102, 80000.00),
    (5, 'Emma Davis', 104, 72000.00),
    (6, 'Emma Stone', 104, 92000.00),
    (7, 'Bob Davis', 101, 56000.00),
    (8, 'Rob Davidson', 101, 92000.00);


-- Q12. Write a query to find the names of employees who earn more than the average salary 
-- of their respective department.


-- -----------------------------------------------

CREATE TABLE Sales (
    SalesPersonID INT,
    SaleAmount DECIMAL(10, 2),
    SaleDate DATE
);

INSERT INTO Sales (SalesPersonID, SaleAmount, SaleDate)
VALUES
    (1, 5000.00, '2024-10-01'),
    (2, 3000.00, '2024-10-02'),
    (1, 4500.00, '2024-10-03'),
    (3, 7000.00, '2024-10-04'),
    (2, 6000.00, '2024-10-05'),
    (3, 8000.00, '2024-10-10'),
    (1, 1500.00, '2024-10-01'),
    (2, 3500.00, '2024-10-02'),
    (1, 5500.00, '2024-10-03');

-- Q13. Write a query to rank each salesperson’s sales for each product based on the Amount, 
-- with the highest sale ranked as 1.


    
Select Version();

-- -------------------------------------------------------
CREATE TABLE IF NOT EXISTS DailySales (
    SaleDate DATE,
    Amount DECIMAL(10, 2)
);

INSERT INTO DailySales (SaleDate, Amount)
VALUES
    ('2024-10-03', 15000.00),
    ('2024-10-07', 8000.00),
    ('2024-10-01', 12000.00),
    ('2024-10-12', 10000.00),
    ('2024-10-15', 25000.00),
    ('2024-10-05', 18000.00),
    ('2024-10-09', 22000.00),
    ('2024-10-10', 14000.00),
    ('2024-10-06', 17000.00),
    ('2024-10-08', 16000.00),
    ('2024-10-11', 30000.00),
    ('2024-10-02', 19000.00),
    ('2024-10-13', 13000.00),
    ('2024-10-14', 21000.00),
    ('2024-10-04', 11000.00);
    
-- Q14. Write a query to calculate a 7-day moving average of daily sales amounts.

-- ----------------------------------------------------------

-- Q15. Write a query to classify each student based on their Score into three categories:
-- "High" if the score is 80 or above
-- "Medium" if the score is between 50 and 79
-- "Low" if the score is below 50

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(100),
    Score DECIMAL(5, 2)
);

INSERT INTO Students (StudentID, Name, Score)
VALUES
    (1, 'Alice Smith', 88.5),
    (2, 'Bob Johnson', 92.0),
    (3, 'Carol Williams', 76.5),
    (4, 'David Brown', 84.0),
    (5, 'Emma Davis', 95.0),
    (6, 'Frank Moore', 67.5),
    (7, 'Grace Lee', 89.0),
    (8, 'Henry Clark', 72.0),
    (9, 'Isabella White', 91.0),
    (10, 'Jack Wilson', 78.5),
    (11, 'Kara Lewis', 85.5),
    (12, 'Liam Harris', 80.0),
    (13, 'Mia Robinson', 90.0),
    (14, 'Noah Walker', 68.0),
    (15, 'Olivia Young', 93.5);

    
SELECT StudentID, Name, Score,
    CASE 
        WHEN Score >= 80 THEN 'High'
        WHEN Score BETWEEN 50 AND 79 THEN 'Medium'
        ELSE 'Low'
    END AS ScoreCategory
FROM Students;
