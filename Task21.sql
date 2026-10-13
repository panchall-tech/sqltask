--
CREATE DATABASE IF NOT EXISTS RestaurantDB;
USE RestaurantDB;

CREATE TABLE Restaurants (
    restaurant_id INT PRIMARY KEY,
    name VARCHAR(100),
    cuisine VARCHAR(50),
    rating DECIMAL(2,1)
);

INSERT INTO Restaurants (restaurant_id, name, cuisine, rating)
VALUES
(1, 'Food Junction', 'Indian', 4.5),
(2, 'Pizza Palace', 'Italian', 4.2),
(3, 'Spice Garden', 'Chinese', 4.0),
(4, 'Burger House', 'Fast Food', 3.8),
(5, 'Royal Thali', 'Gujarati', 4.7),
(6, 'Tasty Bites', 'Indian', 4.1),
(7, 'Pasta Point', 'Italian', 4.3),
(8, 'Dosa Corner', 'South Indian', 4.6);

SELECT * FROM Restaurants;

--
CREATE DATABASE IF NOT EXISTS RestaurantDB;
USE RestaurantDB;

CREATE TABLE IF NOT EXISTS Restaurants (
    restaurant_id INT PRIMARY KEY,
    name VARCHAR(100),
    cuisine VARCHAR(50),
    rating DECIMAL(2,1)
);

INSERT INTO Restaurants (restaurant_id, name, cuisine, rating)
VALUES
(1, 'Food Junction', 'Indian', 4.5),
(2, 'Pizza Palace', 'Italian', 4.2),
(3, 'Spice Garden', 'Chinese', 4.0),
(4, 'Burger House', 'Fast Food', 3.8),
(5, 'Royal Thali', 'Gujarati', 4.7),
(6, 'Tasty Bites', 'Indian', 4.1),
(7, 'Pasta Point', 'Italian', 4.3),
(8, 'Dosa Corner', 'South Indian', 4.6);

-- Filter by cuisine type
SET @cuisine_type = 'Chinese';

SELECT *
FROM Restaurants
WHERE cuisine = @cuisine_type;

--
CREATE DATABASE IF NOT EXISTS RestaurantDB;
USE RestaurantDB;

CREATE TABLE IF NOT EXISTS Restaurants (
    restaurant_id INT PRIMARY KEY,
    name VARCHAR(100),
    cuisine VARCHAR(50),
    rating DECIMAL(2,1)
);

INSERT INTO Restaurants (restaurant_id, name, cuisine, rating)
VALUES
(1, 'Food Junction', 'Indian', 4.5),
(2, 'Pizza Palace', 'Italian', 4.2),
(3, 'Spice Garden', 'Chinese', 4.0),
(4, 'Burger House', 'Fast Food', 3.8),
(5, 'Royal Thali', 'Gujarati', 4.7),
(6, 'Tasty Bites', 'Indian', 4.1),
(7, 'Pasta Point', 'Italian', 4.3),
(8, 'Dosa Corner', 'South Indian', 4.6);

-- Add a new restaurant record
INSERT INTO Restaurants (restaurant_id, name, cuisine, rating)
VALUES (9, 'Punjabi Dhaba', 'Punjabi', 4.4);

-- View updated data
SELECT * FROM Restaurants;

--
CREATE DATABASE IF NOT EXISTS RestaurantDB;
USE RestaurantDB;

CREATE TABLE IF NOT EXISTS Restaurants (
    restaurant_id INT PRIMARY KEY,
    name VARCHAR(100),
    cuisine VARCHAR(50),
    rating DECIMAL(2,1)
);

INSERT INTO Restaurants (restaurant_id, name, cuisine, rating)
VALUES
(1, 'Food Junction', 'Indian', 4.5),
(2, 'Pizza Palace', 'Italian', 4.2),
(3, 'Spice Garden', 'Chinese', 3.9),
(4, 'Burger House', 'Fast Food', 3.8),
(5, 'Royal Thali', 'Gujarati', 4.7),
(6, 'Tasty Bites', 'Indian', 4.1),
(7, 'Pasta Point', 'Italian', 4.3),
(8, 'Dosa Corner', 'South Indian', 4.6);

-- Filter restaurants with rating above 4.0
SELECT name, cuisine, rating
FROM Restaurants
WHERE rating > 4.0
ORDER BY rating DESC;

--
CREATE DATABASE IF NOT EXISTS RestaurantDB;
USE RestaurantDB;

CREATE TABLE IF NOT EXISTS Restaurants (
    restaurant_id INT PRIMARY KEY,
    name VARCHAR(100),
    cuisine VARCHAR(50),
    rating DECIMAL(2,1)
);

INSERT INTO Restaurants (restaurant_id, name, cuisine, rating)
VALUES
(1, 'Food Junction', 'Indian', 4.5),
(2, 'Pizza Palace', 'Italian', 4.2),
(3, 'Spice Garden', 'Chinese', 3.9),
(4, 'Burger House', 'Fast Food', 3.8),
(5, 'Royal Thali', 'Gujarati', 4.7),
(6, 'Tasty Bites', 'Indian', 4.1),
(7, 'Pasta Point', 'Italian', 4.3),
(8, 'Dosa Corner', 'South Indian', 4.6),
(9, 'Punjabi Dhaba', 'Punjabi', 3.5),
(10, 'Cafe Aroma', 'Continental', 5.0);

-- Parameterized rating range
SET @min_rating = 3.5;
SET @max_rating = 5.0;

SELECT *
FROM Restaurants
WHERE rating BETWEEN @min_rating AND @max_rating
ORDER BY rating DESC;