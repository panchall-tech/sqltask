CREATE TABLE ZomatoReviewsDemo (
    review_id INT PRIMARY KEY,
    restaurant_name VARCHAR(100),
    rating DECIMAL(2,1)
);

INSERT INTO ZomatoReviewsDemo
VALUES
(1, 'Pizza Palace', 4.5),
(2, 'Pizza Palace', 4.2),
(3, 'Burger House', 3.5),
(4, 'Burger House', 4.0),
(5, 'Royal Dine', 4.8),
(6, 'Royal Dine', 4.6),
(7, 'Royal Dine', 4.9),
(8, 'Food Corner', 3.8),
(9, 'Food Corner', 4.2),
(10, 'Spice Hub', 4.3);
CREATE VIEW TopRatedRestaurants AS
SELECT
    restaurant_name,
    AVG(rating) AS average_rating,
    COUNT(*) AS total_reviews
FROM ZomatoReviewsDemo
GROUP BY restaurant_name
HAVING AVG(rating) > 4.0;

--
CREATE TABLE RestaurantsDemo (
    restaurant_name VARCHAR(100) PRIMARY KEY,
    city VARCHAR(50)
);

INSERT INTO RestaurantsDemo
VALUES
('Pizza Palace', 'Ahmedabad'),
('Burger House', 'Surat'),
('Royal Dine', 'Vadodara'),
('Food Corner', 'Rajkot'),
('Spice Hub', 'Ahmedabad');
CREATE OR REPLACE VIEW TopRatedRestaurants AS
SELECT
    r.restaurant_name,
    r.city,
    AVG(rv.rating) AS average_rating,
    COUNT(*) AS total_reviews
FROM ZomatoReviewsDemo rv
INNER JOIN RestaurantsDemo r
    ON rv.restaurant_name = r.restaurant_name
GROUP BY r.restaurant_name, r.city
HAVING AVG(rv.rating) > 4.0;
SELECT * FROM TopRatedRestaurants;

--
UPDATE TopRatedRestaurants
SET average_rating = 5.0
WHERE restaurant_name = 'Pizza Palace';

--
CREATE TABLE SwiggyOrdersDemo (
    order_id INT PRIMARY KEY,
    order_date DATE,
    total_amount DECIMAL(10,2)
);

INSERT INTO SwiggyOrdersDemo
VALUES
(1, CURDATE() - INTERVAL 1 DAY, 250),
(2, CURDATE() - INTERVAL 1 DAY, 300),
(3, CURDATE() - INTERVAL 2 DAY, 450),
(4, CURDATE() - INTERVAL 3 DAY, 200),
(5, CURDATE() - INTERVAL 5 DAY, 350),
(6, CURDATE() - INTERVAL 10 DAY, 500),
(7, CURDATE() - INTERVAL 15 DAY, 150),
(8, CURDATE() - INTERVAL 20 DAY, 400),
(9, CURDATE() - INTERVAL 29 DAY, 250),
(10, CURDATE() - INTERVAL 40 DAY, 600);
CREATE VIEW DailyOrderSummary AS
SELECT
    order_date,
    COUNT(*) AS total_orders,
    SUM(total_amount) AS total_revenue
FROM SwiggyOrdersDemo
WHERE order_date >= CURDATE() - INTERVAL 29 DAY
  AND order_date <= CURDATE()
GROUP BY order_date;
SELECT * FROM DailyOrderSummary
ORDER BY order_date;


