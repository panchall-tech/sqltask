--
CREATE TABLE MusicArtists (
    artist_id INT PRIMARY KEY,
    name VARCHAR(100),
    followers BIGINT
);

INSERT INTO MusicArtists (artist_id, name, followers)
VALUES
(1, 'Arijit Singh', 45000000),
(2, 'Taylor Swift', 95000000),
(3, 'Justin Bieber', 75000000),
(4, 'Shreya Ghoshal', 30000000),
(5, 'Ed Sheeran', 85000000),
(6, 'Badshah', 25000000);
WITH TopArtists AS (
    SELECT artist_id, name, followers
    FROM MusicArtists
    ORDER BY followers DESC
    LIMIT 3
)
SELECT *
FROM TopArtists;

--
CREATE TABLE FlipkartMonthlyOrders (
    order_id INT PRIMARY KEY,
    user_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2)
);

INSERT INTO FlipkartMonthlyOrders
(order_id, user_id, order_date, total_amount)
VALUES
(1, 101, '2023-01-15', 5000),
(2, 102, '2023-01-20', 3000),
(3, 103, '2023-02-10', 7000),
(4, 101, '2023-02-18', 4000),
(5, 104, '2023-03-05', 9000),
(6, 102, '2023-03-15', 6000),
(7, 105, '2023-04-12', 2000),
(8, 103, '2023-04-25', 3000);
WITH MonthlyTotals AS (
    SELECT
        MONTH(order_date) AS month,
        SUM(total_amount) AS total_sales
    FROM FlipkartMonthlyOrders
    WHERE order_date >= '2023-01-01'
      AND order_date < '2024-01-01'
    GROUP BY MONTH(order_date)
)
SELECT month, total_sales
FROM MonthlyTotals
ORDER BY total_sales DESC
LIMIT 1;

--
CREATE TABLE MyCalendarDays (
    day_date DATE
);
WITH RECURSIVE DateList AS (
    SELECT CURDATE() AS day_date

    UNION ALL

    SELECT DATE_ADD(day_date, INTERVAL 1 DAY)
    FROM DateList
    WHERE day_date < DATE_ADD(CURDATE(), INTERVAL 6 DAY)
)
SELECT day_date
FROM DateList;
INSERT INTO MyCalendarDays (day_date)
WITH RECURSIVE DateList AS (
    SELECT CURDATE() AS day_date

    UNION ALL

    SELECT DATE_ADD(day_date, INTERVAL 1 DAY)
    FROM DateList
    WHERE day_date < DATE_ADD(CURDATE(), INTERVAL 6 DAY)
)
SELECT day_date
FROM DateList;

--
CREATE TABLE ZomatoCityData (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(100),
    rating DECIMAL(2,1)
);

INSERT INTO ZomatoCityData (id, name, city, rating)
VALUES
(1, 'Honest', 'Ahmedabad', 4.5),
(2, 'Swati Snacks', 'Ahmedabad', 4.7),
(3, 'Dominos', 'Mumbai', 3.8),
(4, 'Bademiya', 'Mumbai', 4.2),
(5, 'La Pinoz', 'Surat', 4.6),
(6, 'Food Junction', 'Surat', 4.8),
(7, 'McDonalds', 'Delhi', 3.5),
(8, 'Haldirams', 'Delhi', 4.1);
WITH CityAverage AS (
    SELECT city, AVG(rating) AS avg_rating
    FROM ZomatoCityData
    GROUP BY city
)
SELECT r.id, r.name, r.city, r.rating
FROM ZomatoCityData r
JOIN CityAverage c
    ON r.city = c.city
WHERE c.avg_rating > 4.0;

--
CREATE TABLE IPLMatchData (
    match_id INT PRIMARY KEY,
    team VARCHAR(100),
    runs INT,
    match_year INT
);

INSERT INTO IPLMatchData (match_id, team, runs, match_year)
VALUES
(1, 'CSK', 220, 2023),
(2, 'CSK', 250, 2023),
(3, 'CSK', 300, 2023),
(4, 'MI', 280, 2023),
(5, 'MI', 260, 2023),
(6, 'MI', 240, 2023),
(7, 'GT', 350, 2023),
(8, 'GT', 300, 2023),
(9, 'RCB', 400, 2023),
(10, 'RCB', 350, 2023),
(11, 'CSK', 500, 2022),
(12, 'MI', 450, 2022);
WITH TeamRuns AS (
    SELECT team, SUM(runs) AS total_runs
    FROM IPLMatchData
    WHERE match_year = 2023
    GROUP BY team
)
SELECT team, total_runs
FROM TeamRuns
WHERE total_runs > 2000;

