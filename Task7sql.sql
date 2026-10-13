-- Write an SQL query to display the total number of orders placed by each user in a 'food_orders' table, grouped by user_id.

create table food(
id int,
user_id int
);

insert into food(id,user_id) values
(1,101),
(2,101),
(3,103),
(4,103),
(5,101),
(6,102);

select user_id,COUNT(*) as total_orders from food
group by user_id;
 
-- Using a 'transactions' table with columns (transaction_id, user_id, amount, payment_method), write an SQL query to show the total amount spent by each payment_method.
CREATE TABLE transactions (
    transaction_id INT,
    user_id INT,
    amount INT,
    payment_method VARCHAR(20)
);
INSERT INTO transactions
(transaction_id, user_id, amount, payment_method)
VALUES
(1, 101, 500, 'UPI'),
(2, 102, 300, 'Cash'),
(3, 101, 700, 'UPI'),
(4, 103, 200, 'Card'),
(5, 102, 400, 'Cash'),
(6, 104, 1000, 'Card'),
(7, 105, 250, 'UPI');
SELECT payment_method, SUM(amount) AS total_amount
FROM transactions
GROUP BY payment_method;

-- Given a 'movies' table with columns (movie_id, genre, box_office_collection), write an SQL query to display each genre and its total box_office_collection, but only show genres where the total collection is above 10
CREATE TABLE movie (
    movie_id INT,
    genre VARCHAR(30),
    box_office_collection INT
);
INSERT INTO movie (movie_id, genre, box_office_collection)
VALUES
(1, 'Action', 8),
(2, 'Comedy', 4),
(3, 'Action', 6),
(4, 'Romance', 3),
(5, 'Comedy', 5),
(6, 'Romance', 2),
(7, 'Thriller', 12);
SELECT genre, SUM(box_office_collection) AS total_collection
FROM movie
GROUP BY genre
HAVING SUM(box_office_collection) > 10;

-- Suppose you have a 'playlist' table with columns (playlist_id, user_id, song_id, duration). Write an SQL query to find users who have created playlists with a combined song duration of more than 2 hours (7200 seconds), showing user_id and total duration. badhu ek sathe app
CREATE TABLE playlist (
    playlist_id INT,
    user_id INT,
    song_id INT,
    duration INT
);
INSERT INTO playlist (playlist_id, user_id, song_id, duration)
VALUES
(1, 101, 1, 2400),
(2, 101, 2, 2500),
(3, 101, 3, 2600),
(4, 102, 4, 1800),
(5, 102, 5, 2000),
(6, 103, 6, 3000),
(7, 103, 7, 2800),
(8, 103, 8, 2500),
(9, 104, 9, 3600),
(10, 104, 10, 3700);
SELECT user_id, SUM(duration) AS total_duration
FROM playlist
GROUP BY user_id
HAVING SUM(duration) > 7200;