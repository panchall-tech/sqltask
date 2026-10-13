-- Write an SQL query to select all restaurants from a table named 'restaurants' where the rating is greater than or equal to 4.5.
SELECT * FROM college.restaurants
where rating >= 4.5;

-- In a table called 'movies', filter and display only the movies released after 2020 and with genre 'Action' using the WHERE clause and AND operator.
select * from movies
where release_year >2020
AND genre ='action';

-- Given a table 'products' with columns (id, name, price, category), write a query to find all products not in the 'Electronics' category or with a price less than 500.
SELECT *
FROM product
WHERE category <> 'Electronics'
   OR price < 500;
   
-- Write an SQL query for a table 'users' to show all users who are NOT from 'Ahmedabad' and have more than 1000 followers.<br><br><em><strong>Hint:</strong> Use the NOT operator combined with AND.</em>   

create table users(
  id int,
  name varchar(50),
  city varchar(50),
  followers int
);

insert into users(id,name,city,followers)values
(1,'rahul','ahmedabad',5000),
(2,'krish','rajkot',500),
(3,'priya','mumbai',2541),
(4,'diya','surat',1254),
(5,'abdul','vadodara',1001),
(6,'harsh','ahmedabad',480);

select * from users
where not city='ahmedabad' and followers > 1000;

