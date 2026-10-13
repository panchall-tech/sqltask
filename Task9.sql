

CREATE TABLE influencers (
    influencer_id INT PRIMARY KEY,
    influencer_name VARCHAR(50),
    city VARCHAR(50)
);

CREATE TABLE brand (
    brand_id INT PRIMARY KEY,
    brand_name VARCHAR(50),
    city VARCHAR(50)
);

SHOW TABLES;

SELECT i.influencer_name, b.brand_name
FROM influencers i
LEFT JOIN brands b ON i.city = b.city
UNION
SELECT i.influencer_name, b.brand_name
FROM influencers i
RIGHT JOIN brand b ON i.city = b.city;
 


--

SELECT
    p.playlist_name AS playlist_name,
    parent.playlist_name AS parent_playlist_name
FROM playlists p
LEFT JOIN playlists parent
ON p.parent_playlist_id = parent.id;

-- 

CREATE TABLE userss (
    user_id INT PRIMARY KEY,
    user_name VARCHAR(50)
);

CREATE TABLE offers (
    offer_id INT PRIMARY KEY,
    offer_title VARCHAR(100)
);

INSERT INTO userss VALUES
(1, 'Rahul'),
(2, 'Priya'),
(3, 'Amit');

INSERT INTO offers VALUES
(101, '50% Off on Shoes'),
(102, '20% Off on Mobiles'),
(103, 'Special Grocery Deal');


SELECT
    u.user_name,
    o.offer_title
FROM users u
CROSS JOIN offers o;

-- 4

SELECT
    e.name AS employee_name,
    m.name AS manager_name
FROM employees e
LEFT JOIN employees m
ON e.manager_id = m.id;

--

SELECT
    u1.user_name AS user1,
    u2.user_name AS user2,
    u1.city
FROM users u1
JOIN users u2
ON u1.city = u2.city
AND u1.id < u2.id;

  

