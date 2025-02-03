(  Code INTEGER,
  Title VARCHAR(255) NOT NULL,
  Rating VARCHAR(255),
  PRIMARY KEY (Code)
);

CREATE TABLE IF NOT EXISTS MovieTheaters (
  Code INTEGER,
  Name VARCHAR(255) NOT NULL,
  Movie INTEGER,
  PRIMARY KEY (Code)
  );

INSERT INTO Movies(Code,Title,Rating) VALUES(1,'Citizen Kane','PG');
INSERT INTO Movies(Code,Title,Rating) VALUES(2,'Singin'' in the Rain','G');
INSERT INTO Movies(Code,Title,Rating) VALUES(3,'The Wizard of Oz','G');
INSERT INTO Movies(Code,Title,Rating) VALUES(4,'The Quiet Man',NULL);
INSERT INTO Movies(Code,Title,Rating) VALUES(5,'North by Northwest',NULL);
INSERT INTO Movies(Code,Title,Rating) VALUES(6,'The Last Tango in Paris','NC-17');
INSERT INTO Movies(Code,Title,Rating) VALUES(7,'Some Like it Hot','PG-13');
INSERT INTO Movies(Code,Title,Rating) VALUES(8,'A Night at the Opera',NULL);
INSERT INTO Movies(Code,Title,Rating) VALUES(9,'One, Two, Three',NULL);

 
INSERT INTO MovieTheaters(Code,Name,Movie) VALUES(1,'Odeon',5);
INSERT INTO MovieTheaters(Code,Name,Movie) VALUES(2,'Imperial',1);
INSERT INTO MovieTheaters(Code,Name,Movie) VALUES(3,'Majestic',NULL);
INSERT INTO MovieTheaters(Code,Name,Movie) VALUES(4,'Royale',6);
INSERT INTO MovieTheaters(Code,Name,Movie) VALUES(5,'Paraiso',3);
INSERT INTO MovieTheaters(Code,Name,Movie) VALUES(6,'Nickelodeon',NULL);

-- 4.1 Select the title of all movies.
SELECT Title FROM Movies;

-- 4.2 Show all the distinct ratings in the database.
SELECT DISTINCT Rating FROM Movies;

-- 4.3 Show all unrated movies.
SELECT Title FROM Movies
WHERE Rating IS NULL;

-- 4.4 Select all movie theaters that are not currently showing a movie.
SELECT Name FROM MovieTheaters
WHERE Movie IS NULL;

-- 4.5 Select all data from all movie theaters and, additionally, the data from the movie that is being shown in the theater (if one is being shown).
SELECT * FROM MovieTheaters
JOIN Movies ON MovieTheaters.Code = Movies.Code;

-- 4.6 Select all data from all movies and, if that movie is being shown in a theater, show the data from the theater.
SELECT * FROM Movies
JOIN MovieTheaters ON Movies.Code = MovieTheaters.Movie
WHERE Movies.Title IS NOT NULL; 

-- 4.7 Show the titles of movies not currently being shown in any theaters.
SELECT Title FROM Movies
JOIN MovieTheaters ON Movies.Code = MovieTheaters.Movie
WHERE Movies.Title IS NULL;

-- 4.8 Add the unrated movie &quot;One, Two, Three&quot;.
--see in Tab SQL 1

-- 4.9 Set the rating of all unrated movies to &quot;G&quot;.
UPDATE Movies
SET Rating = 'G'
WHERE Rating IS NULL;

-- 4.10 Remove movie theaters projecting movies rated &quot;NC-17&quot;.
--DELETE FROM MovieTheaters

--WHERE Name in 

(SELECT Name FROM MovieTheaters

JOIN Movies ON MovieTheaters.Movie = Movies.Code

WHERE Movies.Rating = 'NC-17')
