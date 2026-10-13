--
CREATE TABLE UserOrderData (
    order_id INT PRIMARY KEY,
    user_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2)
);

INSERT INTO UserOrderData
(order_id, user_id, order_date, total_amount)
VALUES
(1, 101, '2023-01-10', 500),
(2, 101, '2023-03-15', 800),
(3, 101, '2023-02-20', 600),
(4, 102, '2023-01-05', 400),
(5, 102, '2023-04-12', 900),
(6, 103, '2023-02-18', 700),
(7, 103, '2023-05-25', 1000),
(8, 104, '2023-03-08', 300),
(9, 104, '2023-06-10', 750),
(10, 105, '2023-04-01', 650);
SELECT
    order_id,
    user_id,
    order_date,
    total_amount,
    ROW_NUMBER() OVER (
        PARTITION BY user_id
        ORDER BY order_date DESC
    ) AS order_number
FROM UserOrderData;

--
CREATE TABLE ArtistSongs (
    song_id INT PRIMARY KEY,
    artist VARCHAR(100),
    streams BIGINT
);

INSERT INTO ArtistSongs (song_id, artist, streams)
VALUES
(1, 'Arijit Singh', 5000000),
(2, 'Arijit Singh', 8000000),
(3, 'Arijit Singh', 3000000),
(4, 'Taylor Swift', 9000000),
(5, 'Taylor Swift', 7000000),
(6, 'Taylor Swift', 9000000),
(7, 'Badshah', 4000000),
(8, 'Badshah', 6000000),
(9, 'Badshah', 2000000),
(10, 'Arijit Singh', 8000000);
SELECT
    song_id,
    artist,
    streams,
    RANK() OVER (
        PARTITION BY artist
        ORDER BY streams DESC
    ) AS song_rank
FROM ArtistSongs;

--
CREATE TABLE MovieGenreData (
    movie_id INT PRIMARY KEY,
    genre VARCHAR(50),
    rating DECIMAL(2,1)
);

INSERT INTO MovieGenreData (movie_id, genre, rating)
VALUES
(1, 'Action', 4.5),
(2, 'Action', 4.8),
(3, 'Action', 4.5),
(4, 'Comedy', 3.9),
(5, 'Comedy', 4.2),
(6, 'Comedy', 4.5),
(7, 'Drama', 4.7),
(8, 'Drama', 4.1),
(9, 'Drama', 4.7),
(10, 'Action', 3.8);
SELECT
    movie_id,
    genre,
    rating,
    DENSE_RANK() OVER (
        PARTITION BY genre
        ORDER BY rating DESC
    ) AS movie_rank
FROM MovieGenreData;

--
CREATE TABLE InfluencerData (
    id INT PRIMARY KEY,
    platform VARCHAR(50),
    followers BIGINT
);

INSERT INTO InfluencerData (id, platform, followers)
VALUES
(1, 'Instagram', 500000),
(2, 'Instagram', 800000),
(3, 'Instagram', 300000),
(4, 'Instagram', 900000),
(5, 'Instagram', 700000),
(6, 'YouTube', 1200000),
(7, 'YouTube', 900000),
(8, 'YouTube', 1500000),
(9, 'YouTube', 600000),
(10, 'YouTube', 1100000),
(11, 'Facebook', 400000),
(12, 'Facebook', 700000),
(13, 'Facebook', 900000),
(14, 'Facebook', 300000);
WITH RankedInfluencers AS (
    SELECT
        id,
        platform,
        followers,
        ROW_NUMBER() OVER (
            PARTITION BY platform
            ORDER BY followers DESC
        ) AS row_num
    FROM InfluencerData
)
SELECT id, platform, followers, row_num
FROM RankedInfluencers
WHERE row_num <= 3;
