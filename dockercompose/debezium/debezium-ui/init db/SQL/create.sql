--CREATE DATABASE sales;


CREATE TABLE IF NOT EXISTS Customers (
  FirstName VARCHAR(50) NOT NULL,
  LastName VARCHAR(50) NOT NULL,
  Email VARCHAR(100),
  Phone VARCHAR(20),
  Address TEXT,
  City VARCHAR(50),
  Country VARCHAR(50),
  RegistrationDate DATE DEFAULT CURRENT_DATE,
  CustomerID INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS Products (
  ProductName VARCHAR(100) NOT NULL,
  Category VARCHAR(50),
  UnitPrice DECIMAL(10,2) NOT NULL,
  StockQuantity INT DEFAULT 0,
  SupplierID INT,
  Description TEXT,
  ProductID INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS Employees (
  FirstName VARCHAR(50) NOT NULL,
  LastName VARCHAR(50) NOT NULL,
  Position VARCHAR(50),
  HireDate DATE,
  Email VARCHAR(100),
  Phone VARCHAR(20),
  EmployeeID BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY
);



CREATE TABLE IF NOT EXISTS MarketSale (
  CustomerID INT NOT NULL,
  ProductID INT NOT NULL,
  Quantity INT NOT NULL,
  SaleDate DATE NOT NULL,
  UnitPrice DECIMAL(10,2) NOT NULL,
  TotalAmount DECIMAL(10,2),
  PaymentMethod VARCHAR(50),
  SalespersonID INT,
  Remarks TEXT,
  saleID INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
  FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
  FOREIGN KEY (SalespersonID) REFERENCES Employees(EmployeeID)
);