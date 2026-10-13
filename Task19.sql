--
CREATE TABLE OrdersPerformanceDemo (
    order_id INT PRIMARY KEY,
    user_id INT,
    order_amount DECIMAL(10,2),
    order_date DATE
);

SET SESSION cte_max_recursion_depth = 10001;

INSERT INTO OrdersPerformanceDemo
    (order_id, user_id, order_amount, order_date)
WITH RECURSIVE nums AS (
    SELECT 1 AS n
    UNION ALL
    SELECT n + 1
    FROM nums
    WHERE n < 10000
)
SELECT
    n,
    MOD(n, 100) + 1,
    MOD(n * 137, 5000) + 100,
    DATE_SUB(CURDATE(), INTERVAL MOD(n, 365) DAY)
FROM nums;
SELECT *
FROM OrdersPerformanceDemo
WHERE user_id = 25;

--
CREATE INDEX idx_user_id
ON OrdersPerformanceDemo(user_id);

SELECT *
FROM OrdersPerformanceDemo
WHERE user_id = 25;

--
CREATE INDEX idx_user_id
ON OrdersPerformanceDemo(user_id);

EXPLAIN
SELECT *
FROM OrdersPerformanceDemo
WHERE user_id = 25;

--
CREATE TABLE ProductsIndexDemo (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
);

INSERT INTO ProductsIndexDemo
VALUES
(1, 'Mouse', 'Electronics', 500),
(2, 'Keyboard', 'Electronics', 800),
(3, 'T-Shirt', 'Clothing', 400),
(4, 'Jeans', 'Clothing', 1200),
(5, 'Mobile', 'Electronics', 15000),
(6, 'Shoes', 'Footwear', 2000);
CREATE INDEX idx_category
ON ProductsIndexDemo(category);
SELECT *
FROM ProductsIndexDemo
WHERE category = 'Electronics';
EXPLAIN
SELECT *
FROM ProductsIndexDemo
WHERE category = 'Electronics';


