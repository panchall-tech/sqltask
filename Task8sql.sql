-- Create two tables in your SQL database: Users (user_id, username, city) and Orders (order_id, user_id, product, amount). Insert at least 3 users and 5 orders, making sure some users have no order 

CREATE TABLE Userr (
    user_id INT PRIMARY KEY,
    username VARCHAR(50),
    city VARCHAR(50)
);
CREATE TABLE Orderr (
    order_id INT PRIMARY KEY,
    user_id INT,
    product VARCHAR(50),
    amount INT
);
INSERT INTO Userr (user_id, username, city)
VALUES
(1, 'Rahul', 'Ahmedabad'),
(2, 'Priya', 'Surat'),
(3, 'Amit', 'Vadodara'),
(4, 'Neha', 'Rajkot');
INSERT INTO Orderr (order_id, user_id, product, amount)
VALUES
(101, 1, 'Laptop', 50000),
(102, 2, 'Mobile', 20000),
(103, 1, 'Mouse', 500),
(104, 3, 'Keyboard', 1500),
(105, 2, 'Headphones', 2500);
SELECT * FROM Userr;
SELECT * FROM Orderr;

-- Write an SQL query using INNER JOIN to list all usernames and their ordered products, showing only users who have placed at least one order.
SELECT Userr.username, Orderr.product
FROM Userr
INNER JOIN Orderr
ON Userr.user_id = Orderr.user_id;

-- 
SELECT Userr.username, Orderr.product
FROM Userr
LEFT JOIN Orderr
ON Userr.user_id = Orderr.user_id;

-- 
SELECT Orderr.order_id, Orderr.user_id,
       Orderr.product, Userr.username
FROM Userr
RIGHT JOIN Orderr
ON Userr.user_id = Orderr.user_id;

-- 
ALTER TABLE Userr
ADD segment_id INT;
CREATE TABLE CustomerSegments (
    segment_id INT PRIMARY KEY,
    segment_name VARCHAR(50)
);
INSERT INTO CustomerSegments (segment_id, segment_name)
VALUES
(1, 'Regular'),
(2, 'Premium'),
(3, 'New Customer');
ALTER TABLE Userr
ADD CONSTRAINT fk_user_segment
FOREIGN KEY (segment_id)
REFERENCES CustomerSegments(segment_id);
UPDATE Userr
SET segment_id = 1
WHERE user_id = 1;

UPDATE Userr
SET segment_id = 2
WHERE user_id = 2;

UPDATE Userr
SET segment_id = 1
WHERE user_id = 3;

UPDATE Userr
SET segment_id = 3
WHERE user_id = 4;
SELECT
    Userr.username,
    CustomerSegments.segment_name,
    COALESCE(SUM(Orders.amount), 0) AS total_order_amount
FROM Users
LEFT JOIN CustomerSegments
    ON Userr.segment_id = CustomerSegments.segment_id
LEFT JOIN Orders
    ON Userr.user_id = Orderr.user_id
GROUP BY
    Userr.user_id,
    Userr.username,
    CustomerSegments.segment_name;
