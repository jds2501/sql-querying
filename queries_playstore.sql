-- Setup for SQL script by starting with a fresh database --
\i ./seed_playstore.sql;

-- 1. Find app with ID 1880
SELECT * FROM analytics WHERE id = 1880;

-- 2. ID & app name last updated on August 1, 2018
SELECT id, app_name FROM analytics WHERE last_updated = '2018-08-01';

-- 3. Count number of apps per category
SELECT category, COUNT(category) FROM analytics GROUP BY category;

-- 4. Top 5 most reviewed apps
SELECT app_name, reviews FROM analytics ORDER BY reviews DESC LIMIT 5;

-- 5. App with most reviews with rating >= 4.8
SELECT app_name FROM analytics WHERE rating >= 4.8 ORDER BY reviews DESC LIMIT 1;

-- 6. Average rating by category ordered by highest to lowest
SELECT category, AVG(rating) FROM analytics GROUP BY category ORDER BY AVG(rating) DESC;

-- 7. Most expensive app with rating < 3
SELECT app_name, price, rating FROM analytics WHERE rating < 3 ORDER BY price DESC LIMIT 1;