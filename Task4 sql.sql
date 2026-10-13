create table restaurant(
id int,
name varchar(50)
);

insert into restaurants(id,name)values
(1,'pepito cafe'),
(2,'charcol cafe'),
(3,'kommo cafe'),
(4,'varanda cafe'),
(5,'ajay cafe');

select * from restaurants
where name like '%cafe';

-- In a Flipkart-style Products table, use the BETWEEN operator to select all products with a price between 500 and 1500 rupees
create table flipkart(
id int,
name varchar(100),
price int
);
insert into flipkart (id,name,price) values
(1,'mobile',1200),
(2,'buds',682),
(3,'laptop',1200),
(4,'c type cable',12),
(5,'computer',1111);

select * from flipkart
where price between 500 and 1500;

-- Write an SQL query to display all users from a Users table whose city is either 'Ahmedabad', 'Surat', or 'Vadodara' using the 

create table user(
id int,
name varchar(100),
city varchar(100)
);

insert into user(id,name,city) values
(1,'rahul','ahmedbad'),
(2,'krish','rajkot'),
(3,'amit','mumbai'),
(4,'priya','ahmedbad'),
(5,'yashvi','bombay'),
(6,'shruti','manali'),
(7,'chintan','kerala');
select * from user
where city in('ahmedbad','kerala');

-- 4
CREATE TABLE Songs (
    song_name VARCHAR(100),
    artist_name VARCHAR(100)
);

INSERT INTO Songs (song_name, artist_name) VALUES
('Kesariya', 'Arijit Singh'),
('Shape of You', 'Ed Sheeran'),
('Perfect', 'Armaan Malik'),
('Tum Hi Ho', 'Arijit Singh'),
('Believer', 'Imagine Dragons'),
('Apna Bana Le', 'Armaan Malik');

SELECT *
FROM Songs
WHERE artist_name LIKE '%ar%';
