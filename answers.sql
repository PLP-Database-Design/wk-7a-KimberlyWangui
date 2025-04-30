-- Question one
-- Remove the repeating groups
CREATE TABLE ProductDetail_1NF (
    OrderID INT,
    CustomerName VARCHAR(100),
    Product VARCHAR(100)
);

INSERT INTO ProductDetail_1NF VALUES (101, 'John Doe', 'Laptop');
INSERT INTO ProductDetail_1NF VALUES (101, 'John Doe', 'Mouse');
INSERT INTO ProductDetail_1NF VALUES (102, 'Jane Smith', 'Tablet');
INSERT INTO ProductDetail_1NF VALUES (102, 'Jane Smith', 'Keyboard');
INSERT INTO ProductDetail_1NF VALUES (102, 'Jane Smith', 'Mouse');
INSERT INTO ProductDetail_1NF VALUES (103, 'Emily Clark', 'Phone');

-- Question two
-- Remove the partial dependencies
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

INSERT INTO Orders VALUES (101, 'John Doe');
INSERT INTO Orders VALUES (102, 'Jane Smith');
INSERT INTO Orders VALUES (103, 'Emily Clark');

CREATE TABLE OrderDetails (
    OrderID INT,
    Product VARCHAR(100),
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

INSERT INTO OrderDetails VALUES (101, 'Laptop', 2);
INSERT INTO OrderDetails VALUES (101, 'Mouse', 1);
INSERT INTO OrderDetails VALUES (102, 'Tablet', 3);
INSERT INTO OrderDetails VALUES (102, 'Keyboard', 1);
INSERT INTO OrderDetails VALUES (102, 'Mouse', 2);
INSERT INTO OrderDetails VALUES (103, 'Phone', 1);





-- Normalization of the table until BCNF
CREATE TABLE Customers(
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50) NOT NULL
);
 
INSERT INTO Customers (CustomerID, CustomerName) VALUES (1, 'John Doe');
INSERT INTO Customers (CustomerID, CustomerName) VALUES (2, 'Jane Smith');
INSERT INTO Customers (CustomerID, CustomerName) VALUES (3, 'Alice Johnson');

CREATE TABLE Products(
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50) NOT NULL
);

INSERT INTO Products (ProductID, ProductName) VALUES (1, 'Laptop');
INSERT INTO Products (ProductID, ProductName) VALUES (2, 'Mouse');
INSERT INTO Products (ProductID, ProductName) VALUES (3, 'Tablet');
INSERT INTO Products (ProductID, ProductName) VALUES (4, 'Keyboard');
INSERT INTO Products (ProductID, ProductName) VALUES (5, 'Phone');

CREATE TABLE Orders(
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Orders(OrderID, CustomerID) VALUES (101, 1);
INSERT INTO Orders(OrderID, CustomerID) VALUES (102, 2);
INSERT INTO Orders(OrderID, CustomerID) VALUES (103, 3);

CREATE TABLE OrderDetails(
    OrderID INT,
    ProductID INT,
    PRIMARY KEY (OrderID, ProductID),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO OrderDetails(OrderID, ProductID) VALUES (101, 1);
INSERT INTO OrderDetails(OrderID, ProductID) VALUES (101, 2);
INSERT INTO OrderDetails(OrderID, ProductID) VALUES (102, 3);
INSERT INTO OrderDetails(OrderID, ProductID) VALUES (102, 4);
INSERT INTO OrderDetails(OrderID, ProductID) VALUES (102, 2);
INSERT INTO OrderDetails(OrderID, ProductID) VALUES (103, 5);
