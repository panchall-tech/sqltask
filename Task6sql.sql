
-- Write an SQL query using the SUM() function to calculate the total amount spent by users on food orders in a table food_orders (columns: order_id, user_id, amount) — imagine it's like Zomato's order history.

create table zomato_food(
order_id int,
user_id int,
amount decimal(10,2)
);
insert into zomato_food(order_id,user_id,amount)values
(1,101,250),
(2,102,450),
(3,103,402),
(4,104,462),
(5,105,525);

select sum(amount) as total_order from zomato_food;

-- Using the COUNT() function, find out how many songs a user has added to their playlist in a table spotify_playlists (columns: playlist_id, user_id, song_id).

create table spotify_song(
id int,
user_id int,
song_id int
);

insert into spotify_song(id,user_id,song_id)values
(1,101,501),
(2,101,502),
(3,101,503),
(4,102,504),
(5,102,505),
(6,101,506);
select COUNT(song_id) as total_song from spotify_song
where user_id = 101;

-- Write an SQL query to get the average rating given to a movie in a table bookmyshow_reviews (columns: review_id, movie_id, rating), and round the result to 1 decimal place using the ROUND() function

CREATE TABLE bookmyshow_reviews (
    review_id INT,
    movie_id INT,
    rating DECIMAL(2,1)
);

INSERT INTO bookmyshow_reviews (review_id, movie_id, rating)
VALUES
(1, 101, 4.5),
(2, 101, 3.8),
(3, 102, 4.2),
(4, 103, 3.5),
(5, 101, 4.0); 

SELECT ROUND(AVG(rating), 1) AS average_rating
FROM bookmyshow_reviews;

-- Find the minimum and maximum transaction values for a user from a table paytm_transactions (columns: txn_id, user_id, amount) — show both the smallest and largest transaction amounts.

CREATE TABLE paytm_transactions (
    txn_id INT,
    user_id INT,
    amount DECIMAL(10,2)
);

INSERT INTO paytm_transactions (txn_id, user_id, amount) VALUES
(1, 101, 500.00),
(2, 101, 150.50),
(3, 102, 900.00),
(4, 101, 750.00),
(5, 102, 250.00);

SELECT
    MIN(amount) AS minimum_amount,
    MAX(amount) AS maximum_amount
FROM paytm_transactions
WHERE user_id = 101;

-- Given a table myntra_orders (columns: order_id, user_id, total_price), write an SQL query to display the total number of orders, the average order value (rounded to 2 decimals), and the highest order value for each user_id

CREATE TABLE myntra_orders (
    order_id INT,
    user_id INT,
    total_price DECIMAL(10,2)
);

INSERT INTO myntra_orders (order_id, user_id, total_price) VALUES
(1, 101, 1500.00),
(2, 101, 2500.00),
(3, 102, 800.00),
(4, 101, 3000.00),
(5, 102, 1200.00),
(6, 103, 4500.00);

SELECT
    user_id,
    COUNT(order_id) AS total_orders,
    ROUND(AVG(total_price), 2) AS average_order_value,
    MAX(total_price) AS highest_order_value
FROM myntra_orders
GROUP BY user_id;