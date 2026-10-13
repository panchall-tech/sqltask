CREATE DATABASE IF NOT EXISTS IPL_Database;
USE IPL_Database;

CREATE TABLE IF NOT EXISTS ipl_matches (
    match_id INT PRIMARY KEY,
    season INT,
    match_date DATE,
    city VARCHAR(50),
    team1 VARCHAR(100),
    team2 VARCHAR(100),
    winner VARCHAR(100),
    win_by_runs INT,
    win_by_wickets INT,
    venue VARCHAR(150)
);


--
CREATE DATABASE IF NOT EXISTS IPL_NewDB;
USE IPL_NewDB;

CREATE TABLE ipl_matches_new (
    match_id INT PRIMARY KEY,
    season INT,
    team1 VARCHAR(100),
    team2 VARCHAR(100),
    winner VARCHAR(100),
    city VARCHAR(50)
);
INSERT INTO ipl_matches_new
VALUES
(1, 2024, 'Mumbai Indians', 'Chennai Super Kings', 'Chennai Super Kings', 'Mumbai'),
(2, 2024, 'Mumbai Indians', 'Gujarat Titans', 'Mumbai Indians', 'Ahmedabad'),
(3, 2024, 'Royal Challengers Bengaluru', 'Mumbai Indians', 'Mumbai Indians', 'Bengaluru'),
(4, 2024, 'Mumbai Indians', 'Kolkata Knight Riders', 'Kolkata Knight Riders', 'Mumbai'),
(5, 2024, 'Rajasthan Royals', 'Sunrisers Hyderabad', 'Rajasthan Royals', 'Jaipur'),
(6, 2024, 'Mumbai Indians', 'Delhi Capitals', 'Mumbai Indians', 'Delhi'),
(7, 2024, 'Punjab Kings', 'Chennai Super Kings', 'Punjab Kings', 'Chennai'),
(8, 2024, 'Lucknow Super Giants', 'Mumbai Indians', 'Lucknow Super Giants', 'Lucknow');

SELECT *
FROM ipl_matches_new
WHERE team1 = 'Mumbai Indians'
   OR team2 = 'Mumbai Indians';
   
--
CREATE DATABASE IF NOT EXISTS IPL_NewDB;
USE IPL_NewDB;

CREATE TABLE IF NOT EXISTS ipl_matches_new (
    match_id INT PRIMARY KEY,
    season INT,
    team1 VARCHAR(100),
    team2 VARCHAR(100),
    winner VARCHAR(100),
    city VARCHAR(100)
);

INSERT INTO ipl_matches_new
(match_id, season, team1, team2, winner, city)
VALUES
(1, 2024, 'Chennai Super Kings', 'Mumbai Indians', 'Chennai Super Kings', 'Chennai'),
(2, 2024, 'Royal Challengers Bengaluru', 'Kolkata Knight Riders', 'Kolkata Knight Riders', 'Bengaluru'),
(3, 2024, 'Mumbai Indians', 'Delhi Capitals', 'Mumbai Indians', 'Mumbai'),
(4, 2024, 'Rajasthan Royals', 'Chennai Super Kings', 'Rajasthan Royals', 'Jaipur'),
(5, 2024, 'Kolkata Knight Riders', 'Mumbai Indians', 'Kolkata Knight Riders', 'Kolkata'),
(6, 2024, 'Delhi Capitals', 'Royal Challengers Bengaluru', 'Delhi Capitals', 'Delhi'),
(7, 2024, 'Mumbai Indians', 'Rajasthan Royals', 'Rajasthan Royals', 'Mumbai'),
(8, 2024, 'Chennai Super Kings', 'Kolkata Knight Riders', 'Chennai Super Kings', 'Chennai');

SELECT team, COUNT(*) AS total_matches
FROM (
    SELECT team1 AS team FROM ipl_matches_new
    UNION ALL
    SELECT team2 AS team FROM ipl_matches_new
) AS all_teams
GROUP BY team
ORDER BY total_matches DESC;


