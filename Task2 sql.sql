CREATE TABLE restaurants(
ID int,
name VARCHAR(100),
Rating Decimal(2,1)
);

INSERT INTO restaurants (id,name,rating)VALUES
(1, 'The Green Restaurant', 4.5),
(2, 'Food Corner', 4.2),
(3, 'Spice Hub', 4.7),
(4, 'Pizza Point', 4.0);

-- select all columns from a table named restaurants using SELECT * FROM restaurants;.

select * FROM restaurants;

-- Write an SQL query to display only the name and rating columns from the table zomato_reviews.
Create table zomato(
id int,
name varchar(100),
rating DECIMAL(2,1),
review VARCHAR(100)
);

INSERT INTO zomato (id, name, rating, review) VALUES
(1, 'The Green Restaurant', 4.5, 'Good food'),
(2, 'Food Corner', 4.2, 'Nice place'),
(3, 'Spice Hub', 4.7, 'Excellent food'),
(4, 'Pizza Point', 4.0, 'Good pizza');

SELECT name,review FROM zomato;

-- rename movie_name as 'Title' and release_year as 'Year Released' in 

create table movies(
   name varchar(30),
   release_year int,
   genre varchar(200)
);

insert into movies(name,release_year) values
('dangal',2016),
('uri',2019),
('kgf2',2022),
('dhamaal4 ',2026);

select name as TITLE,release_year as 'Year realeased' from movies;

-- In a table called products, write an SQL query that selects all columns and add a comment in your SQL code

create table product(
id int,
name varchar(100),
price int
);

insert into product(id,name,price) values
(101,'Laptop',65000),
(102,'mobile',6500),
(103,'watch',5000),
(104,'tv',25000),
(105,'machine',18000);

select*from product;

--
ALTER table movies
ADD genre varchar(100);

UPDATE movies
SET genre = 'Drama'
WHERE name = 'dangal';
UPDATE movies
SET genre = 'Action'
WHERE name = 'uri';
UPDATE movies
SET genre = 'Action'
WHERE name = 'kgf2';
UPDATE movies
SET genre = 'Comedy'
WHERE name = 'dhamaal4';

-- 
ALTER TABLE product
ADD COLUMN category VARCHAR(50);

UPDATE product SET category = 'Electronics' WHERE id = 101;
UPDATE product SET category = 'Electronics' WHERE id = 102;
UPDATE product SET category = 'Accessories' WHERE id = 103;
UPDATE product SET category = 'Electronics' WHERE id = 104;
UPDATE product SET category = 'Machine' WHERE id = 105;
