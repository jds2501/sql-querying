-- Setup for SQL script by starting with a fresh database --
\i ./seed_playstore.sql;

-- 1. Find app with ID 1880
SELECT * FROM analytics WHERE id = 1880;

-- 2. ID & app name last updated on August 1, 2018
SELECT id, app_name FROM analytics WHERE last_updated = '2018-08-01';

-- 3. Count number of apps per category
SELECT category, COUNT(*) FROM analytics GROUP BY category;

-- 4. Top 5 most reviewed apps
SELECT app_name, reviews FROM analytics ORDER BY reviews DESC LIMIT 5;

-- 5. App with most reviews with rating >= 4.8
SELECT app_name FROM analytics WHERE rating >= 4.8 ORDER BY reviews DESC LIMIT 1;

-- 6. Average rating by category ordered by highest to lowest
SELECT category, AVG(rating) FROM analytics GROUP BY category ORDER BY AVG(rating) DESC;

-- 7. Most expensive app with rating < 3
SELECT app_name, price, rating FROM analytics WHERE rating < 3 ORDER BY price DESC LIMIT 1;

-- 8. Apps with min install <= 50 and have a rating, ordered by highest rated
SELECT app_name FROM analytics WHERE min_installs <= 50 AND rating IS NOT NULL ORDER BY rating DESC;

-- 9. App names rated less than 3 with at least 10k reviews
SELECT app_name FROM analytics WHERE rating < 3 AND reviews >= 10000;

-- 10. Top 10 most reviewed apps that cost 0.10 - 1
SELECT app_name FROM analytics WHERE price BETWEEN 0.10 AND 1.00 ORDER BY reviews DESC LIMIT 10;

-- 11. Find the most outdated app
SELECT app_name FROM analytics ORDER BY last_updated LIMIT 1;

-- 12. Find the most expensive app
SELECT app_name FROM analytics ORDER BY price DESC LIMIT 1;

-- 13. Count all the reviews
SELECT SUM(reviews) FROM analytics;

-- 14. Find all categories with more than 300 apps
SELECT category FROM analytics GROUP BY category HAVING COUNT(*) > 300;

-- 15. App with highest proportion of min_install to reviews, with apps taht have been installed at least 100000 times
SELECT app_name, reviews, min_installs, min_installs / reviews AS proportion FROM analytics WHERE min_installs >= 100000 ORDER BY min_installs / reviews DESC LIMIT 1;

-- FS1. Name & rating of top rated apps in each category (apps installed at least 50000 times)
SELECT app_name, rating, category FROM analytics
  WHERE (rating, category) in (
    SELECT MAX(rating), category FROM analytics
      WHERE min_installs >= 50000
      GROUP BY category
    )
  ORDER BY category;

-- FS2. Find all the apps that have a name similar to “facebook”.
SELECT app_name FROM analytics WHERE app_name ILIKE '%facebook%';

-- FS3. Find all the apps that have more than 1 genre.
SELECT app_name FROM analytics WHERE array_length(genres, 1) > 1;

-- FS4. Find all the apps that have education as one of their genres.
SELECT app_name FROM analytics WHERE 'Education' = ANY(genres);
