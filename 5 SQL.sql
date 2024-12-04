create Database abc;

use abc;

-- ---------
CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    sale_date DATE,
    amount DECIMAL(10, 2)
);

INSERT INTO sales (sale_id, sale_date, amount)
VALUES
    (1, '2024-11-01', 150.00),
    (2, '2023-10-02', 200.50),
    (3, '2023-01-03', 350.75),
    (4, '2024-11-04', 420.00),
    (5, '2024-04-05', 275.25),
    (6, '2023-12-01', 150.00),
    (7, '2024-12-01', 200.00),
    (8, '2023-01-01', 150.00);
    
    
select* from sales;


-- Q1. Write a query to find the total sales amount for each month of the year 2023.

SELECT Month(sale_date) as month, sum(amount) as TotalSales FROM Sales 
where Year(sale_date) = 2023
group by Month(Sale_Date) 
Order by Month;



-- ---------------------------------------------------
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    City VARCHAR(50)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    OrderAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Customers (CustomerID, CustomerName, City)
VALUES
    (1, 'Alice Smith', 'New York'),
    (2, 'Bob Johnson', 'Los Angeles'),
    (3, 'Charlie Davis', 'Chicago'),
    (4, 'Robin Smith', 'Chicago'),
    (5, 'Tom Cruise', 'London');
    
INSERT INTO Orders (OrderID, CustomerID, OrderDate, OrderAmount)
VALUES
    (101, 1, '2023-01-01', 250.00),
    (102, 2, '2024-11-03', 150.50),
    (103, 4, '2023-10-04', 300.75),
    (104, 3, '2022-04-05', 450.00),
    (105, 5, '2024-02-07', 120.25);

-- Q2. Write a query to find the names of customers who have placed an order after January 1, 2023.

SELECT C.CUSTOMERNAME FROM CUSTOMERS C
JOIN ORDERS O
ON O.CUSTOMERID = C.CUSTOMERID
WHERE O.ORDERDATE > '2023-01-01';


-- ---------------------------

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    DepartmentID INT,
    Salary DECIMAL(10, 2)
);

INSERT INTO Employees (EmployeeID, DepartmentID, Salary)
VALUES
    (1, 101, 55000.00),
    (2, 102, 62000.00),
    (3, 101, 48000.00),
    (4, 103, 75000.00),
    (5, 101, 51000.00);

-- Q3. Write a query to find the 2nd highest salary for department 101.

SELECT MAX(SALARY) AS SECOND_HIGHEST_SALARY FROM EMPLOYEES
WHERE SALARY < (SELECT MAX(SALARY) FROM EMPLOYEES WHERE DEPARTMENTID = 101)
AND DEPARTMENTID = 101;




-- -----------------------------------------------------

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Price DECIMAL(10, 2)
);

CREATE TABLE Sale (
    SaleID INT PRIMARY KEY,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO Products (ProductID, ProductName, Price)
VALUES
    (1, 'Laptop', 1200.00),
    (2, 'Smartphone', 800.00),
    (3, 'Tablet', 500.00),
    (4, 'Headphones', 150.00),
    (5, 'Smartwatch', 200.00);

INSERT INTO Sale (SaleID, ProductID, Quantity)
VALUES
    (101, 1, 3),
    (102, 2, 5),
    (103, 1, 2),
    (104, 4, 10),
    (105, 1, 4);


-- Q4 Write a query to find the names of all products that have never been sold.  -> subquery

SELECT PRODUCTNAME FROM PRODUCTS
WHERE PRODUCTID NOT IN (SELECT DISTINCT PRODUCTID FROM SALE);


-- --------------------------------------------
CREATE TABLE order_ (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderAmount DECIMAL(10, 2)
);

INSERT INTO Order_ (OrderID, CustomerID, OrderAmount)
VALUES
    (1, 101, 550.00),
    (2, 102, 150.50),
    (3, 101, 300.75),
    (4, 103, 450.00),
    (5, 103, 500.00),
    (6, 101, 250.00),
    (7, 104, 400.00),
    (8, 103, 820.25);

-- Q5. Write a query to find the IDs of customers whose total order amount exceeds $1000. -> group by & having


-- ----------------------------------------------------------------

