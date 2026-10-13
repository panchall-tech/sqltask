--
CREATE TABLE ZomatoAppOrders_K (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    amount DECIMAL(10,2),
    order_date DATE
);

CREATE TABLE DirectDineOrders_K (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    amount DECIMAL(10,2),
    order_date DATE
);

INSERT INTO ZomatoAppOrders_K
(order_id, customer_name, amount, order_date)
VALUES
(1, 'Rahul', 450.00, '2026-10-01'),
(2, 'Amit', 320.50, '2026-10-02'),
(3, 'Priya', 600.00, '2026-10-03');

INSERT INTO DirectDineOrders_K
(order_id, customer_name, amount, order_date)
VALUES
(1, 'Neha', 700.00, '2026-10-01'),
(2, 'Karan', 250.00, '2026-10-02'),
(3, 'Riya', 520.00, '2026-10-04');

SELECT * FROM ZomatoAppOrders_K;
SELECT * FROM DirectDineOrders_K;

-- 
SELECT customer_name
FROM ZomatoAppOrders_K

UNION

SELECT customer_name
FROM DirectDineOrders_K;

--
SELECT order_id, customer_name, amount, order_date
FROM ZomatoAppOrders_K

UNION ALL

SELECT order_id, customer_name, amount, order_date
FROM DirectDineOrders_K;

--
INSERT INTO ZomatoAppOrders_K
(order_id, customer_name, amount, order_date)
VALUES
(3, 'Rahul', 280.00, '2026-10-05');

INSERT INTO DirectDineOrders_K
(order_id, customer_name, amount, order_date)
VALUES
(3, 'Rahul', 350.00, '2026-10-05');

SELECT customer_name
FROM ZomatoAppOrders_K

UNION

SELECT customer_name
FROM DirectDineOrders_K;