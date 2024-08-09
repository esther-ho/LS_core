-- Create an `extrasolar` database
CREATE DATABASE extrasolar;

-- Connect to the `extrasolar` database
\c extrasolar

/*
- Create a `stars` table with:
  - `id` column that is auto-incrementing and the primary key
  - `name` column that holds strings up to 25 characters, is unique and NOT NULL
  - `distance` column that holds whole numbers greater than 0, and NOT NULL
  - `spectral_type` column that holds a one character string
  - `companions` column that holds a non-negative whole number, and NOT NULL

- Create a `planets` table with:
  - `id` column that is auto-incrementing and the primary key
  - `designation` column that holds a single unique alphabetic character
  - `mass` column that holds an integer
*/
DROP TABLE IF EXISTS stars, planets;

CREATE TABLE stars (
  id serial PRIMARY KEY,
  name varchar(25) UNIQUE NOT NULL,
  distance integer NOT NULL,
  spectral_type char(1),
  companions integer NOT NULL,
  CHECK (distance > 0),
  CHECK (companions >= 0)
);

CREATE TABLE planets (
  id serial PRIMARY KEY,
  designation char(1) UNIQUE,
  mass integer
);
