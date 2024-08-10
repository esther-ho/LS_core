-- Create an `animals` database
CREATE DATABASE animals;
-- Alternatively, `createdb animals` can be executed from the terminal console

-- Connect to the `animals` database
\c animals

/*
- Make a `birds` table with:
  - id (primary key)
  - name (string up to 25 characters)
  - age (integer)
  - species (string no more than 15 characters)
*/
CREATE TABLE birds (
  id serial PRIMARY KEY,
  name varchar(25),
  age integer,
  species varchar(15)
);

-- Insert data into the `birds` table
INSERT INTO birds (name, age, species)
VALUES ('Charlie', 3, 'Finch'),
       ('Allie', 5, 'Owl'),
       ('Jennifer', 3, 'Magpie'),
       ('Jamie', 4, 'Owl'),
       ('Roy', 8, 'Crow');

-- Query all data currently in the `birds` table
SELECT * FROM birds;

-- Return records for birds under the age of 5
SELECT *
  FROM birds
 WHERE age < 5;

-- Update the `birds` table so that rows with the species 'Crow' now read 'Raven'
UPDATE birds
   SET species = 'Raven'
 WHERE species = 'Crow';

-- Return results after the update; 'Crow' should now be replaced with 'Raven'
SELECT * FROM birds;

-- Update the `birds` table so that 'Jamie' isn't an 'Owl' but a 'Hawk'
UPDATE birds
   SET species = 'Hawk'
 WHERE id = 4;

-- Return results after the update; Jamie should now be a 'Hawk'
SELECT * FROM birds;

-- Delete the record that describes the 3 year-old finch
DELETE FROM birds
      WHERE age = 3
        AND species = 'Finch';

-- Return results after the deletion; Charlie the 3 year-old finch should be deleted
SELECT * FROM birds;

-- Add constraint so that only birds with a positive age can be added to the database
ALTER TABLE birds
  ADD CHECK (age > 0);

-- Check that the CHECK constraint was added; the following code should throw an error
INSERT INTO birds (name, age, species)
VALUES ('Barry', -2, 'Parakeet');

-- Drop the `birds` table from the `animals` database
DROP TABLE IF EXISTS birds;

-- Connect to a different database
\c sql_exercises

-- Delete `animals` database
DROP DATABASE animals;
-- Alternatively, `dropdb animals` can be executed from the terminal console
