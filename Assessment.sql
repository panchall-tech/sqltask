CREATE DATABASE IF NOT EXISTS FoodDeliveryDB;
USE FoodDeliveryDB;

DROP TABLE IF EXISTS orders;

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    restaurant_name VARCHAR(100),
    revenue DECIMAL(10,2)
);
INSERT INTO orders VALUES
(1, 'Food Palace', 30000),
(2, 'Food Palace', 35000),
(3, 'Food Palace', 40000),
(4, 'Pizza House', 50000),
(5, 'Pizza House', 60000),
(6, 'Burger Point', 20000);


SELECT
    restaurant_name,
    COUNT(*) AS total_orders,
    SUM(revenue) AS total_revenue
FROM orders
GROUP BY restaurant_name
HAVING SUM(revenue) > 100000
   AND COUNT(*) >= 50;
   
   -- GROUP BY groups all orders belonging to the same restaurant. SUM(revenue) calculates the total revenue, while COUNT(*) counts the number of orders.
-- HAVING filters the grouped results to include only restaurants with total revenue greater than ₹1,00,000 and at least 50 orders.


-- 2

USE FoodDeliveryDB;

DROP TABLE IF EXISTS customer_orders;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100)
);

CREATE TABLE customer_orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    order_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id)
);
INSERT INTO customers VALUES
(1, 'Rahul'),
(2, 'Priya'),
(3, 'Amit'),
(4, 'Neha');


INSERT INTO customer_orders VALUES
(101, 1, '2026-09-10', 500),
(102, 1, '2026-10-05', 800),
(103, 2, '2026-09-20', 600),
(104, 3, '2026-10-01', 450);

-- Display every customer and their latest order
WITH RankedOrders AS (
    SELECT
        order_id,
        customer_id,
        order_date,
        order_amount,
        ROW_NUMBER() OVER (
            PARTITION BY customer_id
            ORDER BY order_date DESC, order_id DESC
        ) AS rn
    FROM customer_orders
)
SELECT
    c.customer_id,
    c.customer_name,
    ro.order_id,
    ro.order_date,
    ro.order_amount
FROM customers c
LEFT JOIN RankedOrders ro
    ON c.customer_id = ro.customer_id
    AND ro.rn = 1
ORDER BY c.customer_id;

-- LEFT JOIN returns all registered customers from the customers table, including customers who have never placed an order. For customers without orders, the order details appear as NULL.

--

USE FoodDeliveryDB;

DROP TABLE IF EXISTS deliveries;

CREATE TABLE deliveries (
    delivery_id INT PRIMARY KEY,
    agent_name VARCHAR(100),
    delivery_time INT
);

INSERT INTO deliveries VALUES
(1, 'Rahul', 20),
(2, 'Rahul', 25),
(3, 'Priya', 15),
(4, 'Priya', 20),
(5, 'Amit', 35),
(6, 'Amit', 40);


SELECT
    agent_name,
    AVG(delivery_time) AS average_delivery_time
FROM deliveries
GROUP BY agent_name
HAVING AVG(delivery_time) < (
    SELECT AVG(delivery_time)
    FROM deliveries
);

-- A subquery is a query nested inside another SQL query. The inner query calculates the overall average delivery time for the platform, while the outer query calculates each agent's average delivery time.

--

USE FoodDeliveryDB;

DROP TABLE IF EXISTS restaurant_revenue;

CREATE TABLE restaurant_revenue (
    restaurant_name VARCHAR(100),
    city VARCHAR(50),
    revenue DECIMAL(12,2)
);

INSERT INTO restaurant_revenue VALUES
('Food Palace', 'Surat', 90000),
('Pizza House', 'Surat', 90000),
('Burger Point', 'Surat', 80000),
('Tasty Bites', 'Surat', 70000),
('Spice Hub', 'Ahmedabad', 95000),
('Royal Meals', 'Ahmedabad', 85000);


SELECT
    restaurant_name,
    city,
    revenue,
    RANK() OVER (
        PARTITION BY city
        ORDER BY revenue DESC
    ) AS revenue_rank,
    DENSE_RANK() OVER (
        PARTITION BY city
        ORDER BY revenue DESC
    ) AS dense_revenue_rank
FROM restaurant_revenue
ORDER BY city, revenue DESC;

-- RANK() and DENSE_RANK() are window functions used to rank rows based on a specified order.

--

USE FoodDeliveryDB;

DROP TABLE IF EXISTS customer_spending;

CREATE TABLE customer_spending (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    total_spend DECIMAL(10,2)
);

INSERT INTO customer_spending VALUES
(1, 'Rahul', 6500),
(2, 'Priya', 5000),
(3, 'Amit', 3000),
(4, 'Neha', 1500);


SELECT
    customer_id,
    customer_name,
    total_spend,
    CASE
        WHEN total_spend > 5000 THEN 'Platinum'
        WHEN total_spend BETWEEN 2000 AND 5000 THEN 'Gold'
        ELSE 'Standard'
    END AS customer_tier
FROM customer_spending;

-- The CASE WHEN expression creates a classification column directly in the query output without creating a separate table.

--
-- section B 
CREATE DATABASE IF NOT EXISTS FoodDeliveryDB;
USE FoodDeliveryDB;


DROP TABLE IF EXISTS food_orders;

CREATE TABLE food_orders (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    restaurant_name VARCHAR(100),
    item_ordered VARCHAR(100),
    quantity INT,
    price_per_item DECIMAL(10,2),
    order_date DATE,
    city VARCHAR(50)
);
INSERT INTO food_orders VALUES
(1, 'Rahul', 'Pizza Palace', 'Margherita Pizza', 2, 350, '2026-10-01', 'Mumbai'),
(2, 'Priya', 'Burger Hub', 'Cheese Burger', 1, 250, '2026-10-02', 'Ahmedabad'),
(3, 'Amit', 'Spice Kitchen', 'Paneer Thali', 2, 400, '2026-10-03', 'Surat'),
(4, 'Neha', 'Pizza Palace', 'Farmhouse Pizza', 1, 550, '2026-10-04', 'Mumbai'),
(5, 'Karan', 'South Treat', 'Masala Dosa', 3, 180, '2026-10-05', 'Ahmedabad'),
(6, 'Riya', 'Burger Hub', 'Double Cheese Burger', 2, 320, '2026-10-06', 'Mumbai'),
(7, 'Dev', 'Spice Kitchen', 'Paneer Biryani', 1, 450, '2026-10-07', 'Surat'),
(8, 'Meera', 'South Treat', 'Idli Sambar', 2, 150, '2026-10-08', 'Mumbai'),
(9, 'Jay', 'Pizza Palace', 'Cheese Burst Pizza', 1, 650, '2026-10-09', 'Ahmedabad'),
(10, 'Anjali', 'Spice Kitchen', 'Veg Biryani', 2, 300, '2026-10-10', 'Surat');

-- Query 1: Mumbai orders sorted by price, highest first
SELECT *
FROM food_orders
WHERE city = 'Mumbai'
ORDER BY price_per_item DESC;

-- Query 2: All distinct restaurant names
SELECT DISTINCT restaurant_name
FROM food_orders;

-- Query 3: Top 5 most expensive individual orders
SELECT *
FROM food_orders
ORDER BY price_per_item DESC
LIMIT 5;

-- 2

CREATE DATABASE IF NOT EXISTS FoodDeliveryDB;
USE FoodDeliveryDB;

DROP TABLE IF EXISTS delivery_orders;

CREATE TABLE delivery_orders (
    order_id INT PRIMARY KEY,
    restaurant_name VARCHAR(100),
    city VARCHAR(50),
    total_amount DECIMAL(10,2),
    order_status VARCHAR(30),
    order_date DATE
);


INSERT INTO delivery_orders VALUES
(1, 'Pizza Palace', 'Mumbai', 2500, 'Delivered', '2026-10-01'),
(2, 'Pizza Palace', 'Mumbai', 3200, 'Delivered', '2026-10-02'),
(3, 'Pizza Palace', 'Surat', 1800, 'Delivered', '2026-10-03'),
(4, 'Burger Hub', 'Ahmedabad', 1500, 'Delivered', '2026-10-01'),
(5, 'Burger Hub', 'Ahmedabad', 2200, 'Delivered', '2026-10-04'),
(6, 'Burger Hub', 'Surat', 1900, 'Cancelled', '2026-10-05'),
(7, 'Spice Kitchen', 'Mumbai', 4000, 'Delivered', '2026-10-02'),
(8, 'Spice Kitchen', 'Surat', 3500, 'Delivered', '2026-10-06'),
(9, 'Spice Kitchen', 'Mumbai', 3000, 'Delivered', '2026-10-07'),
(10, 'South Treat', 'Ahmedabad', 1200, 'Delivered', '2026-10-03'),
(11, 'South Treat', 'Surat', 1600, 'Delivered', '2026-10-08'),
(12, 'Royal Meals', 'Mumbai', 6000, 'Delivered', '2026-10-09');


SELECT
    restaurant_name,
    SUM(total_amount) AS total_revenue,
    COUNT(*) AS total_orders,
    AVG(total_amount) AS average_order_value,
    CASE
        WHEN SUM(total_amount) > 10000 THEN 'High Revenue'
        ELSE 'Moderate Revenue'
    END AS revenue_category
FROM delivery_orders
GROUP BY restaurant_name
HAVING SUM(total_amount) > 5000;

-- 3

CREATE DATABASE IF NOT EXISTS FoodDeliveryDB;
USE FoodDeliveryDB;

-- Drop tables in the correct order
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS restaurants;

-- 1. Create customers table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(50),
    phone VARCHAR(15)
);

-- 2. Create restaurants table
CREATE TABLE restaurants (
    restaurant_id INT PRIMARY KEY,
    name VARCHAR(100),
    cuisine_type VARCHAR(50),
    city VARCHAR(50)
);

-- 3. Create orders table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    restaurant_id INT,
    amount DECIMAL(10,2),
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(restaurant_id)
);

-- Insert 6 customers
INSERT INTO customers VALUES
(1, 'Rahul', 'Mumbai', '9876543210'),
(2, 'Priya', 'Ahmedabad', '9876543211'),
(3, 'Amit', 'Surat', '9876543212'),
(4, 'Neha', 'Mumbai', '9876543213'),
(5, 'Karan', 'Ahmedabad', '9876543214'),
(6, 'Riya', 'Surat', '9876543215');

-- Insert 6 restaurants
INSERT INTO restaurants VALUES
(101, 'Pizza Palace', 'Italian', 'Mumbai'),
(102, 'Spice Kitchen', 'Indian', 'Ahmedabad'),
(103, 'Burger Hub', 'Fast Food', 'Surat'),
(104, 'South Treat', 'South Indian', 'Mumbai'),
(105, 'Royal Meals', 'Indian', 'Ahmedabad'),
(106, 'Tasty Bites', 'Chinese', 'Surat');

-- Insert 6 orders
-- Customers 5 and 6 have no orders
INSERT INTO orders VALUES
(1001, 1, 101, 850, '2026-10-01'),
(1002, 2, 102, 650, '2026-10-02'),
(1003, 3, 103, 450, '2026-10-03'),
(1004, 4, 104, 700, '2026-10-04'),
(1005, 1, 104, 500, '2026-10-05'),
(1006, 2, 105, 900, '2026-10-06');

-- Query 1: INNER JOIN
-- Show orders with customer and restaurant names
SELECT
    o.order_id,
    c.name AS customer_name,
    r.name AS restaurant_name,
    o.amount,
    o.order_date
FROM orders o
INNER JOIN customers c
    ON o.customer_id = c.customer_id
INNER JOIN restaurants r
    ON o.restaurant_id = r.restaurant_id;

-- Query 2: LEFT JOIN
-- Show all customers, including customers without orders
SELECT
    c.customer_id,
    c.name AS customer_name,
    o.order_id,
    o.amount,
    o.order_date,
    r.name AS restaurant_name
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
LEFT JOIN restaurants r
    ON o.restaurant_id = r.restaurant_id;

-- Query 3: Orders where customer and restaurant
-- belong to the same city
SELECT
    o.order_id,
    c.name AS customer_name,
    c.city AS customer_city,
    r.name AS restaurant_name,
    r.city AS restaurant_city,
    o.amount
FROM orders o
INNER JOIN customers c
    ON o.customer_id = c.customer_id
INNER JOIN restaurants r
    ON o.restaurant_id = r.restaurant_id
WHERE c.city = r.city;

-- 4

CREATE DATABASE IF NOT EXISTS FoodDeliveryDB;
USE FoodDeliveryDB;

DROP TABLE IF EXISTS deliveries;

-- Create table
CREATE TABLE deliveries (
    delivery_id INT PRIMARY KEY,
    agent_name VARCHAR(100),
    restaurant_name VARCHAR(100),
    delivery_time_mins INT,
    order_date DATE
);

-- Insert 12 rows across 4 delivery agents
INSERT INTO deliveries VALUES
(1, 'Rahul', 'Pizza Palace', 20, '2026-10-01'),
(2, 'Rahul', 'Burger Hub', 25, '2026-10-02'),
(3, 'Rahul', 'Spice Kitchen', 22, '2026-10-03'),
(4, 'Priya', 'South Treat', 15, '2026-10-01'),
(5, 'Priya', 'Pizza Palace', 18, '2026-10-04'),
(6, 'Priya', 'Burger Hub', 16, '2026-10-05'),
(7, 'Amit', 'Spice Kitchen', 35, '2026-10-02'),
(8, 'Amit', 'South Treat', 40, '2026-10-06'),
(9, 'Amit', 'Pizza Palace', 32, '2026-10-07'),
(10, 'Neha', 'Burger Hub', 25, '2026-10-03'),
(11, 'Neha', 'South Treat', 28, '2026-10-08'),
(12, 'Neha', 'Spice Kitchen', 27, '2026-10-09');

-- CTE, window function, scalar subquery, and CASE WHEN
WITH agent_stats AS (
    SELECT
        agent_name,
        AVG(delivery_time_mins) AS avg_delivery_time
    FROM deliveries
    GROUP BY agent_name
)
SELECT
    agent_name,
    ROUND(avg_delivery_time, 2) AS avg_delivery_time,
    RANK() OVER (
        ORDER BY avg_delivery_time ASC
    ) AS speed_rank,
    (
        SELECT AVG(delivery_time_mins)
        FROM deliveries
    ) AS platform_avg_time,
    CASE
        WHEN avg_delivery_time <= (
            SELECT AVG(delivery_time_mins)
            FROM deliveries
        )
        THEN 'On Track'
        ELSE 'Needs Improvement'
    END AS performance_status
FROM agent_stats
ORDER BY speed_rank;

-- section C 

CREATE DATABASE IF NOT EXISTS FoodDeliveryDB;
USE FoodDeliveryDB;

-- Drop old tables in foreign-key order
DROP VIEW IF EXISTS vw_daily_order_summary;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS delivery_agents;
DROP TABLE IF EXISTS restaurants;
DROP TABLE IF EXISTS customers;

-- 1. CUSTOMERS TABLE
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    city VARCHAR(50),
    phone VARCHAR(15)
);

-- 2. RESTAURANTS TABLE
CREATE TABLE restaurants (
    restaurant_id INT PRIMARY KEY,
    restaurant_name VARCHAR(100) NOT NULL,
    cuisine_type VARCHAR(50),
    city VARCHAR(50)
);

-- 3. DELIVERY AGENTS TABLE
CREATE TABLE delivery_agents (
    agent_id INT PRIMARY KEY,
    agent_name VARCHAR(100) NOT NULL,
    city VARCHAR(50)
);

-- 4. ORDERS TABLE
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    restaurant_id INT NOT NULL,
    agent_id INT NOT NULL,
    order_amount DECIMAL(10,2),
    order_date DATE,
    delivery_time_mins INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(restaurant_id),
    FOREIGN KEY (agent_id) REFERENCES delivery_agents(agent_id)
);

-- Insert 10 customers
INSERT INTO customers VALUES
(1,'Rahul','Mumbai','9000000001'),
(2,'Priya','Ahmedabad','9000000002'),
(3,'Amit','Surat','9000000003'),
(4,'Neha','Mumbai','9000000004'),
(5,'Karan','Ahmedabad','9000000005'),
(6,'Riya','Surat','9000000006'),
(7,'Dev','Mumbai','9000000007'),
(8,'Meera','Ahmedabad','9000000008'),
(9,'Jay','Surat','9000000009'),
(10,'Anjali','Mumbai','9000000010');

-- Insert 10 restaurants across 3 cities
INSERT INTO restaurants VALUES
(101,'Pizza Palace','Italian','Mumbai'),
(102,'Burger Hub','Fast Food','Ahmedabad'),
(103,'Spice Kitchen','Indian','Surat'),
(104,'South Treat','South Indian','Mumbai'),
(105,'Royal Meals','Indian','Ahmedabad'),
(106,'Tasty Bites','Chinese','Surat'),
(107,'Food Corner','Multi-Cuisine','Mumbai'),
(108,'Green Bowl','Healthy Food','Ahmedabad'),
(109,'Urban Tandoor','Indian','Surat'),
(110,'Noodle House','Chinese','Mumbai');

-- Insert 10 delivery agents
INSERT INTO delivery_agents VALUES
(201,'Arjun','Mumbai'),
(202,'Pooja','Ahmedabad'),
(203,'Vikram','Surat'),
(204,'Isha','Mumbai'),
(205,'Manish','Ahmedabad'),
(206,'Kavya','Surat'),
(207,'Rohan','Mumbai'),
(208,'Simran','Ahmedabad'),
(209,'Harsh','Surat'),
(210,'Diya','Mumbai');

-- Insert 20 realistic orders
-- Dates are relative to the current date for the VIEW task
INSERT INTO orders VALUES
(1001,1,101,201,1800,CURDATE()-INTERVAL 1 DAY,22),
(1002,2,102,202,2500,CURDATE()-INTERVAL 1 DAY,18),
(1003,3,103,203,1200,CURDATE()-INTERVAL 2 DAY,30),
(1004,4,101,204,2200,CURDATE()-INTERVAL 2 DAY,25),
(1005,5,105,205,3200,CURDATE()-INTERVAL 3 DAY,20),
(1006,6,103,206,1500,CURDATE()-INTERVAL 3 DAY,32),
(1007,7,101,207,1900,CURDATE()-INTERVAL 4 DAY,24),
(1008,8,102,208,2800,CURDATE()-INTERVAL 4 DAY,19),
(1009,9,106,209,900,CURDATE()-INTERVAL 5 DAY,35),
(1010,10,104,210,1700,CURDATE()-INTERVAL 5 DAY,23),
(1011,1,101,201,2100,CURDATE()-INTERVAL 6 DAY,21),
(1012,2,105,202,2600,CURDATE()-INTERVAL 6 DAY,17),
(1013,3,103,203,1400,CURDATE()-INTERVAL 7 DAY,29),
(1014,4,101,204,2300,CURDATE()-INTERVAL 8 DAY,26),
(1015,5,105,205,3500,CURDATE()-INTERVAL 9 DAY,20),
(1016,6,103,206,1600,CURDATE()-INTERVAL 10 DAY,31),
(1017,7,101,207,2000,CURDATE()-INTERVAL 11 DAY,24),
(1018,8,102,208,3000,CURDATE()-INTERVAL 12 DAY,18),
(1019,9,106,209,1100,CURDATE()-INTERVAL 13 DAY,34),
(1020,10,104,210,1800,CURDATE()-INTERVAL 14 DAY,22);

-- TASK 1: Restaurant revenue report
SELECT
    r.restaurant_name,
    COUNT(o.order_id) AS total_orders,
    SUM(o.order_amount) AS total_revenue,
    ROUND(AVG(o.order_amount), 2) AS average_order_value
FROM restaurants r
JOIN orders o
    ON r.restaurant_id = o.restaurant_id
GROUP BY r.restaurant_id, r.restaurant_name
HAVING COUNT(o.order_id) > 3
ORDER BY total_revenue DESC;

-- TASK 2: Customer spending segmentation
SELECT
    c.customer_id,
    c.customer_name,
    COALESCE(SUM(o.order_amount), 0) AS total_spend,
    CASE
        WHEN COALESCE(SUM(o.order_amount), 0) > 5000
            THEN 'Platinum'
        WHEN COALESCE(SUM(o.order_amount), 0) >= 2000
            THEN 'Gold'
        ELSE 'Standard'
    END AS customer_tier
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_spend DESC;

-- TASK 3: Top 3 restaurants in each city
WITH restaurant_revenue AS (
    SELECT
        r.restaurant_id,
        r.restaurant_name,
        r.city,
        SUM(o.order_amount) AS total_revenue
    FROM restaurants r
    JOIN orders o
        ON r.restaurant_id = o.restaurant_id
    GROUP BY r.restaurant_id, r.restaurant_name, r.city
),
ranked_restaurants AS (
    SELECT
        restaurant_id,
        restaurant_name,
        city,
        total_revenue,
        DENSE_RANK() OVER (
            PARTITION BY city
            ORDER BY total_revenue DESC
        ) AS revenue_rank
    FROM restaurant_revenue
)
SELECT *
FROM ranked_restaurants
WHERE revenue_rank <= 3
ORDER BY city, revenue_rank;

-- TASK 4: Each customer's most recent order
WITH customer_recent_orders AS (
    SELECT
        c.customer_name,
        o.order_id,
        o.order_amount,
        o.order_date,
        ROW_NUMBER() OVER (
            PARTITION BY c.customer_id
            ORDER BY o.order_date DESC, o.order_id DESC
        ) AS rn
    FROM customers c
    JOIN orders o
        ON c.customer_id = o.customer_id
)
SELECT
    customer_name,
    order_id,
    order_amount,
    order_date
FROM customer_recent_orders
WHERE rn = 1
ORDER BY customer_name;

-- TASK 5: Create a view joining all four tables
CREATE VIEW vw_daily_order_summary AS
SELECT
    o.order_date,
    c.customer_name,
    r.restaurant_name,
    da.agent_name,
    o.order_amount,
    o.delivery_time_mins
FROM orders o
JOIN customers c
    ON o.customer_id = c.customer_id
JOIN restaurants r
    ON o.restaurant_id = r.restaurant_id
JOIN delivery_agents da
    ON o.agent_id = da.agent_id;

-- Query the view for orders in the last 7 days
SELECT *
FROM vw_daily_order_summary
WHERE order_date >= CURDATE() - INTERVAL 7 DAY
  AND order_date < CURDATE() + INTERVAL 1 DAY
ORDER BY order_date DESC;

-- 

-- section d
-- Write a MySQL 8.0 query to find the top 3 delivery agents in each city, ranked by the number of completed orders. Include each agent's average delivery time and rank. Only include agents who have completed more than 5 orders in that city. Sort the final output by city name alphabetically and rank ascending. Use window functions and explain the query.


-- AI's original query (contains a logical error)

WITH agent_stats AS (
    SELECT
        city,
        agent_name,
        COUNT(*) AS completed_orders,
        AVG(delivery_time_mins) AS avg_delivery_time
    FROM agent_orders
    WHERE order_status = 'Completed'
    GROUP BY city, agent_name
),
ranked_agents AS (
    SELECT
        city,
        agent_name,
        completed_orders,
        avg_delivery_time,
        ROW_NUMBER() OVER (
            PARTITION BY city
            ORDER BY completed_orders DESC
        ) AS agent_rank
    FROM agent_stats
)
SELECT *
FROM ranked_agents
WHERE completed_orders > 5
  AND agent_rank <= 3
ORDER BY city ASC, agent_rank ASC;

--

-- Corrected query

WITH agent_stats AS (
    SELECT
        city,
        agent_name,
        COUNT(*) AS completed_orders,
        AVG(delivery_time_mins) AS avg_delivery_time
    FROM agent_orders
    WHERE order_status = 'Completed'
    GROUP BY city, agent_name
    HAVING COUNT(*) > 5
),
ranked_agents AS (
    SELECT
        city,
        agent_name,
        completed_orders,
        avg_delivery_time,
        ROW_NUMBER() OVER (
            PARTITION BY city
            ORDER BY completed_orders DESC, agent_name ASC
        ) AS agent_rank
    FROM agent_stats
)
SELECT
    city,
    agent_name,
    completed_orders,
    ROUND(avg_delivery_time, 2) AS avg_delivery_time,
    agent_rank
FROM ranked_agents
WHERE agent_rank <= 3
ORDER BY city ASC, agent_rank ASC;

--

USE FoodDeliveryDB;

DROP TABLE IF EXISTS agent_orders;

CREATE TABLE agent_orders (
    order_id INT PRIMARY KEY,
    city VARCHAR(50),
    agent_name VARCHAR(100),
    order_status VARCHAR(30),
    delivery_time_mins INT
);

INSERT INTO agent_orders VALUES
(1, 'Ahmedabad', 'Rahul', 'Completed', 20),
(2, 'Ahmedabad', 'Rahul', 'Completed', 22),
(3, 'Ahmedabad', 'Rahul', 'Completed', 25),
(4, 'Ahmedabad', 'Rahul', 'Completed', 18),
(5, 'Ahmedabad', 'Rahul', 'Completed', 24),
(6, 'Ahmedabad', 'Rahul', 'Completed', 21),
(7, 'Ahmedabad', 'Priya', 'Completed', 15),
(8, 'Ahmedabad', 'Priya', 'Completed', 18),
(9, 'Ahmedabad', 'Priya', 'Completed', 16),
(10, 'Ahmedabad', 'Priya', 'Completed', 19),
(11, 'Ahmedabad', 'Priya', 'Completed', 17),
(12, 'Ahmedabad', 'Priya', 'Completed', 20);
-- The original query ranked all agents before filtering out those with five or fewer completed orders. This could produce incorrect rankings and exclude eligible agents from the top three. I corrected it by applying `HAVING COUNT(*) > 5` inside the aggregation CTE before using the window function. I also added `agent_name` as a secondary sort criterion to make rankings deterministic when order counts are tied.











