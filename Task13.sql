--
CREATE TABLE AppOrders (
    order_id INT PRIMARY KEY,
    user_id INT,
    order_amount DECIMAL(10,2),
    app_name VARCHAR(50)
);

INSERT INTO AppOrders (order_id, user_id, order_amount, app_name)
VALUES
(1, 101, 500, 'Zomato'),
(2, 102, 1200, 'Swiggy'),
(3, 103, 800, 'Flipkart'),
(4, 101, 650, 'Swiggy'),
(5, 104, 1500, 'Flipkart'),
(6, 105, 400, 'Zomato'),
(7, 102, 900, 'Zomato'),
(8, 106, 2000, 'Flipkart'),
(9, 103, 750, 'Swiggy'),
(10, 104, 1100, 'Zomato');
SELECT
    order_id,
    user_id,
    order_amount,
    app_name,
    SUM(order_amount) OVER() AS total_order_amount
FROM AppOrders;

--
SELECT
    user_id,
    order_id,
    order_amount,
    AVG(order_amount) OVER (
        PARTITION BY user_id
    ) AS avg_user_order_amount
FROM AppOrders;

--
CREATE TABLE UserPlaylist (
    song_id INT PRIMARY KEY,
    user_id INT,
    duration_sec INT
);

INSERT INTO UserPlaylist (song_id, user_id, duration_sec)
VALUES
(1, 101, 210),
(2, 101, 180),
(3, 101, 240),
(4, 102, 200),
(5, 102, 190),
(6, 103, 220),
(7, 103, 250),
(8, 104, 175),
(9, 104, 205),
(10, 105, 300);
SELECT
    song_id,
    user_id,
    duration_sec,
    SUM(duration_sec) OVER (
        PARTITION BY user_id
    ) AS total_duration_sec
FROM UserPlaylist;

--
CREATE TABLE MovieRatingData (
    rating_id INT PRIMARY KEY,
    user_id INT,
    movie_name VARCHAR(100),
    rating DECIMAL(2,1)
);

INSERT INTO MovieRatingData
(rating_id, user_id, movie_name, rating)
VALUES
(1, 101, 'KGF 2', 5),
(2, 102, 'KGF 2', 4),
(3, 103, 'KGF 2', 3),
(4, 101, 'Dangal', 5),
(5, 104, 'Dangal', 4),
(6, 105, 'Dangal', 3),
(7, 102, 'Jawan', 4),
(8, 103, 'Jawan', 5),
(9, 104, 'Jawan', 3),
(10, 105, 'Jawan', 4);
SELECT
    rating_id,
    user_id,
    movie_name,
    rating,
    AVG(rating) OVER (
        PARTITION BY movie_name
    ) AS avg_movie_rating,
    rating - AVG(rating) OVER (
        PARTITION BY movie_name
    ) AS rating_difference
FROM MovieRatingData;