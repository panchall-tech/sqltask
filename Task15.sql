--
SELECT NOW() AS CurrentDateTime;

--
CREATE TABLE OrderDateData (
    order_id INT PRIMARY KEY,
    order_date DATE
);

INSERT INTO OrderDateData (order_id, order_date)
VALUES
(1, '2023-01-15'),
(2, '2023-05-20'),
(3, '2024-08-10'),
(4, '2024-12-25'),
(5, '2025-03-08');
SELECT
    order_date,
    YEAR(order_date) AS order_year,
    MONTH(order_date) AS order_month,
    DAY(order_date) AS order_day
FROM OrderDateData;

--
CREATE TABLE DeliveryDateData (
    delivery_id INT PRIMARY KEY,
    delivery_date DATE
);

INSERT INTO DeliveryDateData (delivery_id, delivery_date)
VALUES
(1, '2026-10-15'),
(2, '2026-10-18'),
(3, '2026-10-20'),
(4, '2026-10-25'),
(5, '2026-10-30');
SELECT
    delivery_date,
    DATE_SUB(delivery_date, INTERVAL 2 DAY) AS expected_pickup_date
FROM DeliveryDateData;

--
CREATE TABLE SubscriptionData (
    user_id INT,
    start_date DATE,
    end_date DATE
);

INSERT INTO SubscriptionData (user_id, start_date, end_date)
VALUES
(101, '2026-01-01', '2026-01-31'),
(102, '2026-02-01', '2026-03-01'),
(103, '2026-03-10', '2026-04-10'),
(104, '2026-04-01', '2026-04-15'),
(105, '2026-05-01', '2026-06-01');
SELECT
    user_id,
    start_date,
    end_date,
    DATEDIFF(end_date, start_date) AS total_days
FROM SubscriptionData;

--
CREATE TABLE AppLoginData (
    user_id INT,
    last_login_date DATE
);

INSERT INTO AppLoginData (user_id, last_login_date)
VALUES
(101, '2026-08-01'),
(102, '2026-09-25'),
(103, '2026-07-15'),
(104, '2026-10-05'),
(105, '2026-08-20');
SELECT user_id, last_login_date
FROM AppLoginData
WHERE DATEDIFF(NOW(), last_login_date) > 30;
