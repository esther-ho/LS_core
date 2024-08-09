-- Create the  `films` table and insert 3 rows of data
DROP TABLE IF EXISTS public.films;
CREATE TABLE films (title varchar(255), "year" integer, genre varchar(100));

INSERT INTO films(title, "year", genre) VALUES ('Die Hard', 1988, 'action');  
INSERT INTO films(title, "year", genre) VALUES ('Casablanca', 1942, 'drama');  
INSERT INTO films(title, "year", genre) VALUES ('The Conversation', 1974, 'thriller');  

-- Return all rows in the `films` table
SELECT * FROM films;

-- Return all rows in the `films` table with a title shorter than 12 letters
SELECT *
  FROM films
 WHERE LENGTH(title) < 12;

/*
- Add two additional columns to the `films` table:
  - `director` for the director's name
  - `duration` for length of the film in minutes
*/
ALTER TABLE films
 ADD COLUMN director varchar(255),
 ADD COLUMN duration integer;

-- Update the existing rows with values for the new columns
UPDATE films
   SET director = 'John McTiernan',
       duration = 132
 WHERE title = 'Die Hard';

UPDATE films
   SET director = 'Michael Curtiz',
       duration = 102
 WHERE title = 'Casablanca';

UPDATE films
   SET director = 'Francis Ford Coppola',
       duration = 113
 WHERE title = 'The Conversation';

-- Return the records in the updated table
SELECT * FROM films;

-- Insert data into the `films` table
INSERT INTO films (title, "year", genre, director, duration)
VALUES ('1984', 1956, 'scifi', 'Michael Anderson', 90),
       ('Tinker Tailor Soldier Spy', 2011, 'espionage', 'Tomas Alfredson', 127),
       ('The Birdcage', 1996, 'comedy', 'Mike Nichols', 118);

-- Return the records in the updated table
SELECT * FROM films;

-- Return the title and age in years of each movie, with newest movies listed first
SELECT title,
       DATE_PART('year', now()) - "year" AS age
  FROM films
 ORDER BY "year" DESC;

-- Return the title and duration of each move longer than two hours, with longest movies first
SELECT title, duration
  FROM films
 WHERE duration > 120
 ORDER BY duration DESC;

-- Return the title of the longest film
SELECT title
  FROM films
 ORDER BY duration DESC
 LIMIT 1;

SELECT title
  FROM films
 WHERE duration = (
  SELECT MAX(duration) FROM films
 );
