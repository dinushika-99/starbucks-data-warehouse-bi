-- 1. Create Staging Database
CREATE DATABASE SLIIT_Retail_Staging;
GO

USE SLIIT_Retail_Staging;
GO

-- 2. Create Staging Tables (Matching Lab Sheet 07)
CREATE TABLE dbo.StgSales (
    SalesOrderID INT PRIMARY KEY,
    OrderDate DATE,
    DueDate DATE,
    ShipDate DATE,
    CustomerKey INT,
    ProductKey INT,
    OrderQuantity INT,
    UnitPrice DECIMAL(10,2),
    TotalAmount DECIMAL(10,2)
);

CREATE TABLE dbo.StgCustomer (
    CustomerKey INT PRIMARY KEY,
    CustomerName NVARCHAR(100),
    Gender NVARCHAR(10),
    YearlyIncome DECIMAL(10,2),
    Country NVARCHAR(50)
);

CREATE TABLE dbo.StgProduct (
    ProductKey INT PRIMARY KEY,
    ProductName NVARCHAR(100),
    Category NVARCHAR(50),
    SubCategory NVARCHAR(50),
    Color NVARCHAR(20)
);

