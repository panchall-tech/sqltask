--
CREATE TABLE RestaurantData (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    rating DECIMAL(2,1)
);

INSERT INTO RestaurantData (id, name, rating)
VALUES
(1, 'Honest', 4.5),
(2, 'Dominos', 3.8),
(3, 'La Pinoz', 4.2),
(4, 'McDonalds', 3.5),
(5, 'Swati Snacks', 4.8),
(6, 'Pizza Hut', 3.9),
(7, 'Subway', 4.1),
(8, 'KFC', 3.6);
SELECT name, rating
FROM RestaurantData
WHERE rating > (
    SELECT AVG(rating)
    FROM RestaurantData
);

--
CREATE TABLE FlipkartProducts (
    product_id INT PRIMARY KEY,
    name VARCHAR(100),
    price DECIMAL(10,2),
    category VARCHAR(50)
);

INSERT INTO FlipkartProducts (product_id, name, price, category)
VALUES
(1, 'Laptop', 50000, 'Electronics'),
(2, 'Mobile', 20000, 'Electronics'),
(3, 'Headphones', 2000, 'Electronics'),
(4, 'TShirt', 800, 'Fashion'),
(5, 'Jeans', 1500, 'Fashion'),
(6, 'Shoes', 2500, 'Fashion'),
(7, 'Chair', 3000, 'Furniture'),
(8, 'Table', 5000, 'Furniture');
SELECT
    name,
    price,
    category,
    (
        SELECT AVG(p2.price)
        FROM FlipkartProducts p2
        WHERE p2.category = p1.category
    ) AS average_category_price
FROM FlipkartProducts p1;

--
CREATE TABLE AppUsers (
    user_id INT PRIMARY KEY,
    username VARCHAR(100)
);

CREATE TABLE UserPlaylists (
    playlist_id INT PRIMARY KEY,
    user_id INT,
    playlist_name VARCHAR(100)
);

INSERT INTO AppUsers (user_id, username)
VALUES
(1, 'Rahul'),
(2, 'Amit'),
(3, 'Krish'),
(4, 'Neha'),
(5, 'Priya'),
(6, 'Jay');

INSERT INTO UserPlaylists (playlist_id, user_id, playlist_name)
VALUES
(1, 1, 'Workout'),
(2, 1, 'Party'),
(3, 1, 'Chill'),
(4, 1, 'Travel'),
(5, 2, 'Romantic'),
(6, 2, 'Bollywood'),
(7, 2, 'Old Songs'),
(8, 3, 'Gaming'),
(9, 3, 'Study'),
(10, 4, 'Favorites'),
(11, 5, 'Morning'),
(12, 5, 'Evening');
SELECT u.username, p.playlist_count
FROM (
    SELECT user_id, COUNT(*) AS playlist_count
    FROM UserPlaylists
    GROUP BY user_id
) AS p
JOIN AppUsers u
    ON p.user_id = u.user_id
WHERE p.playlist_count > (
    SELECT AVG(playlist_count)
    FROM (
        SELECT u2.user_id, COUNT(p2.playlist_id) AS playlist_count
        FROM AppUsers u2
        LEFT JOIN UserPlaylists p2
            ON u2.user_id = p2.user_id
        GROUP BY u2.user_id
    ) AS avg_data
);

--
CREATE TABLE FoodOrders (
    order_id INT PRIMARY KEY,
    user_id INT,
    total_amount DECIMAL(10,2)
);

INSERT INTO FoodOrders (order_id, user_id, total_amount)
VALUES
(1, 101, 250),
(2, 102, 500),
(3, 103, 150),
(4, 101, 800),
(5, 104, 350),
(6, 102, 1000),
(7, 105, 200),
(8, 103, 650);
SELECT DISTINCT user_id
FROM FoodOrders
WHERE total_amount > (
    SELECT AVG(total_amount)
    FROM FoodOrders
);
