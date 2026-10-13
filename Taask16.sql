--
CREATE TABLE UserNameData (
    user_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);

INSERT INTO UserNameData (user_id, first_name, last_name)
VALUES
(1, 'Krish', 'Patel'),
(2, 'Rahul', 'Sharma'),
(3, 'Amit', 'Shah'),
(4, 'Neha', 'Joshi'),
(5, 'Priya', 'Mehta');
SELECT
    CONCAT(first_name, ' ', last_name) AS full_name
FROM UserNameData;

--
CREATE TABLE PlaylistTitles (
    song_id INT PRIMARY KEY,
    song_title VARCHAR(100)
);

INSERT INTO PlaylistTitles (song_id, song_title)
VALUES
(1, 'Kesariya'),
(2, 'Tum Hi Ho'),
(3, 'Chaleya'),
(4, 'Heeriye'),
(5, 'Apna Bana Le');
SELECT UPPER(song_title) AS song_title
FROM PlaylistTitles;

--
CREATE TABLE FoodItemsDemo (
    item_code VARCHAR(50)
);

INSERT INTO FoodItemsDemo (item_code)
VALUES
('  F101  '),
(' F102'),
('F103  '),
('  F104'),
('F105'),
('  F106  ');
SELECT TRIM(item_code) AS item_code
FROM FoodItemsDemo;

--
CREATE TABLE MoviesDemo (
    imdb_id VARCHAR(20)
);

INSERT INTO MoviesDemo (imdb_id)
VALUES
('tt1234567'),
('tt7654321'),
('tt9876543'),
('tt1122334'),
('tt5566778');
SELECT RIGHT(imdb_id, 7) AS movie_number
FROM MoviesDemo;

--
CREATE TABLE ProductSKU_Demo (
    sku_code VARCHAR(50)
);

INSERT INTO ProductSKU_Demo (sku_code)
VALUES
('MOB-123-XY'),
('LAP-456-AB'),
('TAB-789-CD'),
('KEY-111-EF'),
('MOU-222-GH');
SELECT REPLACE(sku_code, '-', '_') AS sku_code
FROM ProductSKU_Demo;