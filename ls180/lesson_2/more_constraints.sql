-- Import data into database
DROP TABLE IF EXISTS public.films;
CREATE TABLE films (title varchar(255), year integer, genre varchar(100), director varchar(255), duration integer);

INSERT INTO films(title, year, genre, director, duration) VALUES ('Die Hard', 1988, 'action', 'John McTiernan', 132);  
INSERT INTO films(title, year, genre, director, duration) VALUES ('Casablanca', 1942, 'drama', 'Michael Curtiz', 102);  
INSERT INTO films(title, year, genre, director, duration) VALUES ('The Conversation', 1974, 'thriller', 'Francis Ford Coppola', 113);  
INSERT INTO films(title, year, genre, director, duration) VALUES ('1984', 1956, 'scifi', 'Michael Anderson', 90);  
INSERT INTO films(title, year, genre, director, duration) VALUES ('Tinker Tailor Soldier Spy', 2011, 'espionage', 'Tomas Alfredson', 127);  
INSERT INTO films(title, year, genre, director, duration) VALUES ('The Birdcage', 1996, 'comedy', 'Mike Nichols', 118);

-- Modify all columns to be `NOT NULL`
ALTER TABLE films
 ALTER COLUMN title SET NOT NULL,
 ALTER COLUMN year SET NOT NULL,
 ALTER COLUMN genre SET NOT NULL,
 ALTER COLUMN director SET NOT NULL,
 ALTER COLUMN duration SET NOT NULL;

-- Display schema of `films` table
\d films

-- Add a constraint to `films` such that all films have a unique title
ALTER TABLE films
 ADD UNIQUE (title);

-- Display schema of `films` table
\d films

-- Remove `UNIQUE` constraint from `films` table
ALTER TABLE films
 DROP CONSTRAINT films_title_key;

-- Display schema of `films` table
\d films

-- Add a constraint to `films` that requires all rows to have a value for `title` that is at least 1 character long
ALTER TABLE films
  ADD CHECK (LENGTH(title) >= 1);

-- Display schema of `films` table
\d films

-- Demonstrate what happens if the above constraint is violated
INSERT INTO films (title, year, genre, director, duration)
VALUES ('', 1990, 'comedy', 'Chris Columbus', 103);

-- Remove the `CHECK` constraint
ALTER TABLE films
 DROP CONSTRAINT films_title_check;

-- Display schema of `films` table
\d films

-- Add a constraint to `films` that ensures all films have a year between 1900 and 2100
ALTER TABLE films
  ADD CHECK (year BETWEEN 1900 AND 2100);

-- Display schema of `films` table
\d films

-- Add a constraint to `films` that requires all rows to have a value for `director` at least 3 characters long and at least 1 space character
ALTER TABLE films
  ADD CHECK (LENGTH(director) >= 3
        AND POSITION(' ' IN director) > 0);

-- Display schema of `films` table
\d films

-- Show the error that occurs when trying to change to director for 'Die Hard' to 'Johnny'
UPDATE films
   SET director = 'Johnny'
 WHERE title = 'Die Hard';
