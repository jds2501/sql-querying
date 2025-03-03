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

-- Movie count by year > 2 movies by Rock Hudson
SELECT movie.yr, COUNT(movie.yr) FROM actor JOIN casting ON (actor.id = casting.actorid)
    JOIN movie ON (casting.movieid = movie.id) WHERE actor.name = 'Rock Hudson'
    GROUP BY movie.yr HAVING COUNT(movie.yr) > 2;

-- Film title and leading actors where Julie Andrews was in the movie
SELECT movie.title, actor.name FROM actor JOIN casting ON (actor.id = casting.actorid)
    JOIN movie ON (casting.movieid = movie.id) WHERE casting.ord = 1 AND
    movie.id IN (SELECT movie.id FROM actor JOIN casting ON (actor.id = casting.actorid)
    JOIN movie ON (casting.movieid = movie.id) WHERE actor.name = 'Julie Andrews');

-- Actors with at least 15 starring roles
SELECT actor.name FROM actor JOIN casting ON (actor.id = casting.actorid)
    JOIN movie ON (casting.movieid = movie.id) WHERE casting.ord = 1
    GROUP BY actor.id HAVING COUNT(casting.movieid) >= 15 ORDER BY actor.name;

-- Films in 1978 ordered by number of actors in cast, then title
SELECT movie.title FROM actor JOIN casting ON (actor.id = casting.actorid)
    JOIN movie ON (casting.movieid = movie.id) WHERE movie.yr = 1978 
    GROUP BY movie.id ORDER BY COUNT(casting.actorid) DESC, movie.title;

-- All people who have worked with Art Garfunkel
SELECT actor.name FROM actor JOIN casting ON (actor.id = casting.actorid)
    JOIN movie ON (casting.movieid = movie.id) WHERE actor.name != 'Art Garfunkel'
    AND movie.id IN (SELECT movie.id FROM actor JOIN casting ON (actor.id = casting.actorid)
    JOIN movie ON (casting.movieid = movie.id) WHERE actor.name = 'Art Garfunkel');