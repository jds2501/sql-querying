DROP DATABASE IF EXISTS movies;

CREATE DATABASE movies;

\c movies

CREATE TABLE actor (
    id SERIAL PRIMARY KEY,
    name VARCHAR(36)
);

CREATE TABLE movie (
    id SERIAL PRIMARY KEY,
    title VARCHAR(70),
    yr DECIMAL(4),
    director INTEGER NOT NULL,
    budget INTEGER,
    gross INTEGER,
    FOREIGN KEY (director) REFERENCES actor(id)
);

CREATE TABLE casting (
    movieid INTEGER,
    actorid INTEGER,
    ord INTEGER,
    PRIMARY KEY (movieid, actorid),
    FOREIGN KEY (movieid) REFERENCES movie(id),
    FOREIGN KEY (actorid) REFERENCES actor(id)
);
