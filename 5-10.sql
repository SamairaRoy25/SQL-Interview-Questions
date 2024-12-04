create database def;

use def;

show tables;

CREATE TABLE Products(
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    CategoryID INT
);

CREATE TABLE Stores (
    StoreID INT PRIMARY KEY,
    StoreName VARCHAR(100),
    City VARCHAR(50)
);

CREATE TABLE Sales(
    SaleID INT PRIMARY KEY,
    ProductID INT,
    StoreID INT,
    Quantity INT,
    SaleDate DATE,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (StoreID) REFERENCES Stores(StoreID)
);


INSERT INTO Products (ProductID, ProductName, CategoryID)
VALUES
    (1, 'Laptop', 101),
    (2, 'Smartphone', 102),
    (3, 'Tablet', 101),
    (4, 'Headphones', 103),
    (5, 'Smartwatch', 102);

INSERT INTO Stores (StoreID, StoreName, City)
VALUES
    (1, 'Tech Hub', 'New York'),
    (2, 'Gadget World', 'Los Angeles'),
    (3, 'Device Central', 'Chicago'),
    (4, 'Tech Guru', 'Los Angeles');

INSERT INTO Sales (SaleID, ProductID, StoreID, Quantity, SaleDate)
VALUES
    (1001, 1, 1, 3, '2022-10-01'),
    (1002, 2, 2, 5, '2024-12-02'),
    (1003, 1, 1, 2, '2023-01-03'),
    (1004, 3, 3, 10, '2021-05-04'),
    (1005, 5, 2, 4, '2023-02-05'),
    (1006, 5, 4, 11, '2023-10-05');

-- Q6. Write a query to get the total quantity sold for each product in the laptop and tablet 
-- category from stores located in Los Angeles during the year 2023.


-- ------------------------------------------------------

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(100),
    ManagerID INT,
    FOREIGN KEY (ManagerID) REFERENCES Employees(EmployeeID)
);

INSERT INTO Employees (EmployeeID, EmployeeName, ManagerID)
VALUES
    (1, 'Alice Johnson', NULL),       
    (2, 'Bob Smith', 1),              
    (3, 'Carol Williams', 1),         
    (4, 'David Brown', 2),            
    (5, 'Emma Davis', 2),             
    (6, 'Frank Miller', 3),           
    (7, 'Grace Lee', 3);              


-- Q7. Write a query to retrieve the names of employees along with the names of their direct managers.


-- -----------------------------------------------------------

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    OrderAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY,
    OrderID INT,
    PaymentAmount DECIMAL(10, 2),
    PaymentDate DATE,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

INSERT INTO Customers (CustomerID, CustomerName)
VALUES
    (1, 'Alice Smith'),
    (2, 'Bob Johnson'),
    (3, 'Charlie Davis');

INSERT INTO Orders (OrderID, CustomerID, OrderDate, OrderAmount)
VALUES
    (101, 1, '2023-01-01', 250.00),
    (102, 2, '2024-11-03', 150.50),
    (103, 1, '2022-10-04', 300.75),
    (104, 3, '2023-12-05', 450.00),
    (105, 2, '2023-12-07', 120.25);

INSERT INTO Payments (PaymentID, OrderID, PaymentAmount, PaymentDate)
VALUES
    (1001, 101, 250.00, '2023-01-04'),
    (1002, 102, 150.50, '2024-11-10'),
    (1003, 103, 150.00, '2022-10-08'),
    (1004, 104, 450.00, '2023-12-06'),
    (1005, 105, 120.25, '2023-12-07');


-- Q8. Write a query to list each customer’s name, total order amount, and total payment amount for orders 
-- placed in 2023.



-- -------------------------------------------------------

CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(100),
    AuthorID INT
);

CREATE TABLE Borrowed (
    BorrowID INT PRIMARY KEY,
    BookID INT,
    BorrowDate DATE,
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

INSERT INTO Books (BookID, Title, AuthorID)
VALUES
    (1, 'To Kill a Mockingbird', 101),
    (2, '1984', 102),
    (3, 'Pride and Prejudice', 103),
    (4, 'The Great Gatsby', 104),
    (5, 'Moby Dick', 105);

INSERT INTO Borrowed (BorrowID, BookID, BorrowDate)
VALUES
    (1001, 1, '2023-10-01'),
    (1002, 2, '2024-08-03'),
    (1003, 1, '2024-11-05'),
    (1004, 3, '2023-12-06'),
    (1005, 4, '2022-10-07');


-- Q9. Write a query to find all books that were not borrowed in the last 6 months.



-- ----------------------------------------

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100)
);

CREATE TABLE Employees_ (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(100),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

CREATE TABLE Salaries (
    EmployeeID INT,
    Salary DECIMAL(10, 2),
    EffectiveDate DATE,
    FOREIGN KEY (EmployeeID) REFERENCES Employees_(EmployeeID),
    PRIMARY KEY (EmployeeID, EffectiveDate)
);


INSERT INTO Departments (DepartmentID, DepartmentName)
VALUES
    (1, 'Human Resources'),
    (2, 'Engineering'),
    (3, 'Marketing'),
    (4, 'Finance');

INSERT INTO Employees_ (EmployeeID, EmployeeName, DepartmentID)
VALUES
    (101, 'Alice Smith', 1),
    (102, 'Bob Johnson', 2),
    (103, 'Carol Williams', 3),
    (104, 'David Brown', 2),
    (105, 'Emma Davis', 4);


INSERT INTO Salaries (EmployeeID, Salary, EffectiveDate)
VALUES
    (101, 60000.00, '2023-01-01'),
    (101, 62000.00, '2024-07-01'),
    (102, 80000.00, '2023-01-01'),
    (103, 55000.00, '2024-11-01'),
    (104, 75000.00, '2024-12-01'),
    (105, 70000.00, '2024-01-01'),
    (105, 72000.00, '2023-07-01');


-- Q10. Write a query to find the total salary expense for each department for the latest salary records only.






