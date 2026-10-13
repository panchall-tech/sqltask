CREATE DATABASE IF NOT EXISTS ZomatoDB;
USE ZomatoDB;

CREATE TABLE IF NOT EXISTS Restaurants (
    restaurant_id INT PRIMARY KEY,
    name VARCHAR(100),
    location VARCHAR(100),
    rating DECIMAL(2,1),
    votes INT
);

INSERT INTO Restaurants
(restaurant_id, name, location, rating, votes)
VALUES
(1, 'Food Palace', 'Koramangala', 4.8, 2500),
(2, 'Spice Hub', 'Koramangala', 4.6, 1800),
(3, 'Pizza Corner', 'Koramangala', 4.5, 1200),
(4, 'Royal Kitchen', 'Koramangala', 4.9, 3000),
(5, 'Burger House', 'Koramangala', 4.2, 900),
(6, 'Cafe Aroma', 'Koramangala', 4.7, 1500),
(7, 'Dosa Point', 'Indiranagar', 4.8, 2000),
(8, 'Punjabi Dhaba', 'Koramangala', 3.9, 700);

SELECT
    name,
    rating AS average_rating,
    votes
FROM Restaurants
WHERE location = 'Koramangala'
ORDER BY rating DESC
LIMIT 5;

--
USE ZomatoDB;

ALTER TABLE Restaurants
ADD COLUMN cuisine VARCHAR(100);

UPDATE Restaurants
SET cuisine = CASE restaurant_id
    WHEN 1 THEN 'North Indian'
    WHEN 2 THEN 'Chinese'
    WHEN 3 THEN 'Italian'
    WHEN 4 THEN 'North Indian'
    WHEN 5 THEN 'Fast Food'
    WHEN 6 THEN 'Cafe'
    WHEN 7 THEN 'South Indian'
    WHEN 8 THEN 'Punjabi'
END;

INSERT INTO Restaurants
(restaurant_id, name, location, rating, votes, cuisine)
VALUES
(9, 'Chinese Wok', 'Indiranagar', 4.3, 800, 'Chinese'),
(10, 'Dosa Corner', 'Indiranagar', 4.5, 900, 'South Indian'),
(11, 'Pasta House', 'Indiranagar', 4.1, 500, 'Italian'),
(12, 'Spice Garden', 'Indiranagar', 4.4, 700, 'Chinese'),
(13, 'Cafe Coffee', 'Indiranagar', 4.0, 600, 'Cafe');

SELECT
    cuisine,
    COUNT(*) AS restaurant_count
FROM Restaurants
WHERE location = 'Indiranagar'
GROUP BY cuisine
ORDER BY restaurant_count DESC;

--
USE ZomatoDB;

ALTER TABLE Restaurants
ADD COLUMN rest_type VARCHAR(100),
ADD COLUMN cost_for_two INT;

UPDATE Restaurants
SET
    rest_type = CASE restaurant_id
        WHEN 1 THEN 'Casual Dining'
        WHEN 2 THEN 'Casual Dining'
        WHEN 3 THEN 'Quick Bites'
        WHEN 4 THEN 'Fine Dining'
        WHEN 5 THEN 'Quick Bites'
        WHEN 6 THEN 'Cafe'
        WHEN 7 THEN 'Casual Dining'
        WHEN 8 THEN 'Quick Bites'
        WHEN 9 THEN 'Quick Bites'
        WHEN 10 THEN 'Casual Dining'
        WHEN 11 THEN 'Casual Dining'
        WHEN 12 THEN 'Fine Dining'
        WHEN 13 THEN 'Cafe'
    END,
    cost_for_two = CASE restaurant_id
        WHEN 1 THEN 800
        WHEN 2 THEN 1200
        WHEN 3 THEN 400
        WHEN 4 THEN 2000
        WHEN 5 THEN 350
        WHEN 6 THEN 600
        WHEN 7 THEN 500
        WHEN 8 THEN 300
        WHEN 9 THEN 450
        WHEN 10 THEN 400
        WHEN 11 THEN 900
        WHEN 12 THEN 1800
        WHEN 13 THEN 700
    END;
    SELECT
    rest_type,
    ROUND(AVG(cost_for_two), 2) AS average_cost_for_two
FROM Restaurants
GROUP BY rest_type
ORDER BY average_cost_for_two DESC;

--
USE ZomatoDB;

SELECT
    name,
    location,
    rating,
    votes,
    CASE
        WHEN votes > 1000 THEN 'Run customer feedback campaign and loyalty offers'
        WHEN votes > 500 THEN 'Offer discounts and improve service quality'
        ELSE 'Promote through social media and local partnerships'
    END AS marketing_action
FROM Restaurants
WHERE rating < 3.0
  AND votes > 200
ORDER BY votes DESC;
INSERT INTO Restaurants
(restaurant_id, name, location, rating, votes, cuisine, rest_type, cost_for_two)
VALUES
(14, 'Tasty Corner', 'Koramangala', 2.8, 450, 'Indian', 'Quick Bites', 400),
(15, 'Food Express', 'Indiranagar', 2.6, 1200, 'Chinese', 'Casual Dining', 700),
(16, 'Spicy Treat', 'Koramangala', 2.9, 250, 'North Indian', 'Cafe', 500);

--
USE ZomatoDB;

SELECT
    name,
    cost_for_two,
    CASE
        WHEN cost_for_two < 500 THEN 'Budget'
        WHEN cost_for_two BETWEEN 500 AND 1500 THEN 'Mid-range'
        WHEN cost_for_two > 1500 THEN 'Premium'
        ELSE 'Unknown'
    END AS market_category
FROM Restaurants
ORDER BY cost_for_two ASC;
SELECT
    CASE
        WHEN cost_for_two < 500 THEN 'Budget'
        WHEN cost_for_two BETWEEN 500 AND 1500 THEN 'Mid-range'
        WHEN cost_for_two > 1500 THEN 'Premium'
        ELSE 'Unknown'
    END AS market_category,
    COUNT(*) AS total_restaurants
FROM Restaurants
GROUP BY market_category
ORDER BY total_restaurants DESC;
