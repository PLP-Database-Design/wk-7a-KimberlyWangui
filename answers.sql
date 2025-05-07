-- Question one
-- Remove the repeating groups
CREATE TABLE ProductDetail (
    OrderID INT,
    CustomerName VARCHAR(100),
    Product VARCHAR(100)
);

INSERT INTO ProductDetail(OrderID, CustomerName, Products)
VALUES
(101, 'John Doe', 'Laptop'),
(101, 'John Doe', 'Mouse'),
(102, 'Jane Smith', 'Tablet'),
(102, 'Jane Smith', 'Keyboard'),
(102, 'Jane Smith', 'Mouse'),
(103, 'Emily Clark', 'Phone');


-- Question two
-- Remove the partial dependencies
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

INSERT INTO Orders VALUES (101, 'John Doe');
INSERT INTO Orders VALUES (102, 'Jane Smith');
INSERT INTO Orders VALUES (103, 'Emily Clark');

CREATE TABLE Product (
    OrderID INT,
    Product VARCHAR(100),
    Quantity INT,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

INSERT INTO Product VALUES (101, 'Laptop', 2);
INSERT INTO Product VALUES (101, 'Mouse', 1);
INSERT INTO Product VALUES (102, 'Tablet', 3);
INSERT INTO Product VALUES (102, 'Keyboard', 1);
INSERT INTO Product VALUES (102, 'Mouse', 2);
INSERT INTO Product VALUES (103, 'Phone', 1);





