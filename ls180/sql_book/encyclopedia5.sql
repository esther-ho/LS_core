/*
- Create a `continents` table with:
  - auto-incrementing `id` column
  - `continent_name` column with type `varchar(50)`
- Remove `continent` column from `countries` table
- Add `continent_id` column to `countries` table
- Add a Foreign Key constraint to the `continent_id` column that references the `id` column of the `continents` table
*/
CREATE TABLE continents (
  id serial PRIMARY KEY,
  continent_name varchar(50)
);

ALTER TABLE countries
 DROP COLUMN continent,
  ADD COLUMN continent_id integer;

ALTER TABLE countries
 ADD FOREIGN KEY (continent_id) REFERENCES continents(id);

-- Add data to the `countries` and `continents` tables
INSERT INTO continents (continent_name)
VALUES ('Africa'),
       ('Asia'),
       ('Europe'),
       ('North America'),
       ('South America');

INSERT INTO countries (name, capital, population, continent_id)
VALUES ('Egypt', 'Cairo', 96308900, 1),
       ('Japan', 'Tokyo', 126672000, 2),
       ('France', 'Paris', 67158000, 3),
       ('Germany', 'Berlin', 82349400, 3),
       ('USA', 'Washington D.C.', 325365189, 4),
       ('Brazil', 'Brasilia', 208385000, 5);

/*
- Create an `albums` table with:
  - auto-incrementing `id` column
  - `album_name` column that holds strings up to 100 characters
  - `released` column that holds a date
  - `genre` column that holds strings up to 100 characters
  - `label` column that holds strings up to 100 characters
  - `singer_id` that holds an integer
- Create a reference from the `albums` table to the `singers` table
*/
ALTER TABLE singers
 ADD PRIMARY KEY (id);

CREATE TABLE albums (
  id serial PRIMARY KEY,
  album_name varchar(100),
  released date,
  genre varchar(100),
  label varchar(100),
  singer_id integer REFERENCES singers(id)
);

INSERT INTO albums (album_name, released, genre, label, singer_id)
VALUES ('Born to Run', '1975-08-25', 'Rock and roll', 'Columbia', 1),
       ('Born in the USA', '1984-06-04', 'Rock and roll, pop', 'Columbia', 1),
       ('Madonna', '1983-07-27', 'Dance-pop, post-disco', 'Warner Bros', 5),
       ('True Blue', '1986-06-30', 'Dance-pop, Pop', 'Warner Bros', 5),
       ('Purple Rain', '1984-06-25', 'Pop, R&B, Rock', 'Warner Bros', 6),
       ('Sign o''the Times', '1987-03-30', 'Pop, R&B, Rock, Funk', 'Paisley Park, Warner Bros', 6),
       ('Elvis', '1956-10-19', 'Rock and roll, Rhythm and Blues', 'RCA Victor', 7),
       ('G.I. Blues', '1960-10-01', 'Rock and roll, Pop', 'RCA Victor', 7);

-- Return all country names and their appropriate continent names
SELECT countries.name, continents.continent_name
  FROM countries
 INNER JOIN continents
    ON countries.continent_id = continents.id;

-- Return all names and capitals of the European countries
SELECT countries.name, countries.capital
  FROM countries
 INNER JOIN continents
    ON countries.continent_id = continents.id
 WHERE continents.continent_name = 'Europe';

SELECT name, capital
  FROM countries
 WHERE continent_id = (
  SELECT id
    FROM continents
   WHERE continent_name = 'Europe'
 );

-- Return the first name of any singer who had an album released under the Warner Bros label
SELECT DISTINCT singers.first_name
  FROM singers
 INNER JOIN albums
    ON singers.id = albums.singer_id
 WHERE albums.label LIKE '%Warner Bros%';

SELECT first_name
  FROM singers
 WHERE id IN (
  SELECT DISTINCT singer_id
    FROM albums
   WHERE label LIKE '%Warner Bros%'
 );

/*
Return the first name and last name of any singer who:
- released an album in the 80s
- is still living,
along with the names of the albums and their release date
- Order results by the singer's age (youngest first)
*/
SELECT s.first_name, s.last_name, a.album_name, a.released
  FROM singers AS s
 INNER JOIN albums AS a
    ON s.id = a.singer_id
 WHERE a.released BETWEEN '1980-01-01' AND '1989-12-31'
   AND s.deceased = false
 ORDER BY s.date_of_birth DESC;

-- Return the first and last name of any singer without an associated album entry
SELECT s.first_name, s.last_name
  FROM singers AS s
  LEFT JOIN albums AS a
    ON s.id = a.singer_id
 WHERE a.album_name IS NULL;

-- Rewrite the above as a sub-query
SELECT first_name, last_name
  FROM singers
 WHERE id NOT IN (
  SELECT DISTINCT singer_id
  FROM albums
 );
