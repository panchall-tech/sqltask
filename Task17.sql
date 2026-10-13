--
CREATE TABLE FoodOrdersDemo (
    order_id INT PRIMARY KEY,
    total_amount DECIMAL(10,2)
);
INSERT INTO FoodOrdersDemo (order_id, total_amount)
VALUES
(1, 150),
(2, 299),
(3, 300),
(4, 650),
(5, 999),
(6, 1000),
(7, 1500),
(8, 250);
SELECT
    order_id,
    total_amount,
    CASE
        WHEN total_amount < 300 THEN 'Small'
        WHEN total_amount BETWEEN 300 AND 999 THEN 'Medium'
        ELSE 'Large'
    END AS order_category
FROM FoodOrdersDemo;

--
CREATE TABLE MoviesPopularityDemo (
    movie_id INT PRIMARY KEY,
    movie_name VARCHAR(100),
    rating DECIMAL(3,1)
);
INSERT INTO MoviesPopularityDemo
VALUES
(1, 'Movie A', 9.2),
(2, 'Movie B', 8.0),
(3, 'Movie C', 7.5),
(4, 'Movie D', 5.0),
(5, 'Movie E', 4.5),
(6, 'Movie F', 3.2);
SELECT
    movie_name,
    rating,
    CASE
        WHEN rating >= 8 THEN 'Blockbuster'
        WHEN rating >= 5 THEN 'Hit'
        ELSE 'Average'
    END AS popularity
FROM MoviesPopularityDemo;

--
CREATE TABLE FlipkartProductsDemo (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10,2)
);

INSERT INTO FlipkartProductsDemo
VALUES
(1, 'Mouse', 300),
(2, 'Keyboard', 500),
(3, 'Headphones', 1500),
(4, 'Speaker', 2000),
(5, 'Monitor', 8500),
(6, 'USB Cable', 150);
SELECT
    product_name,
    price,
    CASE
        WHEN price < 500 THEN 'Budget'
        WHEN price <= 2000 THEN 'Standard'
        ELSE 'Premium'
    END AS price_category
FROM FlipkartProductsDemo;

--
CREATE TABLE SpotifyTracksDemo (
    track_id INT PRIMARY KEY,
    track_name VARCHAR(100),
    duration_seconds INT
);

INSERT INTO SpotifyTracksDemo
VALUES
(1, 'Song A', 120),
(2, 'Song B', 179),
(3, 'Song C', 180),
(4, 'Song D', 240),
(5, 'Song E', 300),
(6, 'Song F', 301),
(7, 'Song G', 360);
SELECT
    track_name,
    duration_seconds,
    CASE
        WHEN duration_seconds < 180 THEN 'Short'
        WHEN duration_seconds BETWEEN 180 AND 300 THEN 'Medium'
        WHEN duration_seconds > 300 THEN 'Long'
    END AS duration_label
FROM SpotifyTracksDemo;
