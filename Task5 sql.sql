-- Write an SQL query using the DISTINCT keyword to find all unique payment methods used in the orders table of a food delivery app database
create table orders(
id int,
name varchar(100),
payment varchar(50)
);

insert into orders(id,name,payment) values
(1,'rauf','cash'),
(2,'krish','upi'),
(3,'arman','creditcard'),
(4,'bhagat','debit'),
(5,'solanki','cash'),
(6,'bhavsar','credit'),
(7,'patel','debit');

SELECT DISTINCT payment FROM Orders;

-- Query the users table to list all cities where users have registered, but display each city only once and sort the result in alphabetical order (A-Z).
SELECT DISTINCT city
FROM Users
ORDER BY city ASC;

-- Write an SQL query to select the top 5 most recent movie bookings from the bookings table, ordered by booking_date in descending order.

create table booking(
id int,
name varchar(1000),
date int
);

INSERT INTO booking (id,name,date) VALUES
(1, 'Dangal', '2026-09-20'),
(2, 'KGF 2', '2026-10-01'),
(3, 'URI', '2026-09-25'),
(4, 'Pushpa 2', '2026-10-05'),
(5, 'Jawan', '2026-09-28'),
(6, 'Pathaan', '2026-10-07'),
(7, 'RRR', '2026-09-15');

select * from booking;



-- From a products table containing Flipkart-style product data (id, name, category, sold_count), write an SQL query to retrieve the 10 products with the highest sold_count, displaying only product name and sold_count, sorted from highest to lowest.<br><br><em><strong>Hint:</strong> Use ORDER BY and LIMIT together to achieve this.</em>

CREATE TABLE items (
    id INT,
    name VARCHAR(100),
    category VARCHAR(50),
    sold_count INT
);

INSERT INTO items (id, name, category, sold_count) VALUES
(1, 'iPhone 15', 'Mobile', 950),
(2, 'Samsung Galaxy S24', 'Mobile', 1200),
(3, 'HP Laptop', 'Laptop', 850),
(4, 'Boat Earbuds', 'Audio', 1500),
(5, 'Dell Laptop', 'Laptop', 700),
(6, 'OnePlus Nord', 'Mobile', 1100),
(7, 'Sony Headphones', 'Audio', 1350),
(8, 'Mi Smart TV', 'TV', 600),
(9, 'Realme Buds', 'Audio', 1250),
(10, 'Lenovo Laptop', 'Laptop', 900),
(11, 'Apple Watch', 'Watch', 1000),
(12, 'JBL Speaker', 'Audio', 800);

SELECT name, sold_count
FROM products
ORDER BY sold_count DESC
LIMIT 10;

