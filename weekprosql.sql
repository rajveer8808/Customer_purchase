create database onlinepurchase;
use onlinepurchase;
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    Country VARCHAR(50)
);
DELETE FROM Customers
WHERE COALESCE (CustomerID,CustomerName, Country) IS NULL;
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    ProductCategory VARCHAR(50)
);
CREATE TABLE purchasedetails (
    TransactionID INT PRIMARY KEY,
    CustomerID INT,
    ProductID INT,
    PurchaseQuantity INT,
    PurchasePrice DECIMAL(10, 2),
    PurchaseDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

SELECT 
    c.CustomerID,
    c.CustomerName,
   
    SUM(pd.PurchaseQuantity * pd.PurchasePrice) AS TotalAmountSpent
FROM 
    Customers c
JOIN 
    purchasedetails pd ON c.CustomerID = pd.CustomerID

GROUP BY 
    c.CustomerID, c.CustomerName
ORDER BY 
    TotalAmountSpent DESC;

    


select * from Customers;