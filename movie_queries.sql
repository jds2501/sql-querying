-- Setup for SQL script by starting with a fresh database --
\i ./movie_data.sql;

-- Films where yr is 1962
SELECT id, title FROM movie WHERE yr = '1962';

-- Year Citizen Kane was released
SELECT yr FROM movie WHERE title = 'Citizen Kane';

-- All Star Trek movies ordered by year
SELECT id, title, yr FROM movie WHERE title LIKE '%Star Trek%' ORDER BY yr;

-- ID of Glenn Close
SELECT id FROM actor WHERE name = 'Glenn Close';

-- ID of Casablanca
SELECT id FROM movie WHERE title = 'Casablanca';

-- Cast list for Casablanca
SELECT actor.name FROM actor JOIN casting ON (actor.id = casting.actorid)
    JOIN movie ON (casting.movieid = movie.id) WHERE movie.id = '11768';

-- Cast list for Alien
SELECT actor.name FROM actor JOIN casting ON (actor.id = casting.actorid)
    JOIN movie ON (casting.movieid = movie.id) WHERE movie.title = 'Alien';

-- Films with Harrison Ford
SELECT movie.title FROM actor JOIN casting ON (actor.id = casting.actorid)
    JOIN movie ON (casting.movieid = movie.id) WHERE actor.name = 'Harrison Ford';

-- Films with Harrison Ford not in a starring role
SELECT movie.title FROM actor JOIN casting ON (actor.id = casting.actorid)
    JOIN movie ON (casting.movieid = movie.id) WHERE actor.name = 'Harrison Ford'
    AND casting.ord != 1;

-- 1962 movies with lead actors
SELECT movie.title, actor.name FROM actor JOIN casting ON (actor.id = casting.actorid)
    JOIN movie ON (casting.movieid = movie.id) WHERE movie.yr = 1962
    AND casting.ord = 1;