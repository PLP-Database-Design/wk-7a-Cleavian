--Q1 Write an SQL query to transform this table into 1NF, ensuring that each row represents a single product for an order

CREATE TABLE sales.productdetail_1NF (
    OrderID INT,
    CustomerName VARCHAR(100),
    Product VARCHAR(200)
);

INSERT INTO sales.productdetail_1NF (OrderID, CustomerName, Product) VALUES
(101, 'John Doe', 'Laptop'),
(101, 'John Doe', 'Mouse'),
(102, 'Jane Smith', 'Tablet'),
(102, 'Jane Smith', 'Keyboard'),
(102, 'Jane Smith', 'Mouse'),
(103, 'Emily Clark', 'Phone');

DROP TABLE sales.productdetail;

ALTER TABLE sales.productdetail_1NF RENAME TO productdetail;

--Q2 Write an SQL query to transform this table into 2NF by removing #partial dependencies. Ensure that each non-key column fully depends #on the entire primary key.

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

CREATE TABLE OrderDetails (
    OrderID INT,
    Product VARCHAR(100),
    Quantity INT,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

INSERT INTO Orders (OrderID, CustomerName) VALUES
(101, 'John Doe'),
(102, 'Jane Smith'),
(103, 'Emily Clark');

INSERT INTO Orders (OrderID, CustomerName) VALUES
(101, 'John Doe'),
(102, 'Jane Smith'),
(103, 'Emily Clark');

