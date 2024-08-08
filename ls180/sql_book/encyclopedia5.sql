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
