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

/*
- Add a `star_id` column to the `planets` table to relate each planet to its home star
- It is required and must reference a value from the `id` column in the `stars` table
*/
ALTER TABLE planets
 ADD COLUMN star_id integer NOT NULL REFERENCES stars(id);

-- Modify the `name` column in the `stars` table to allow a name up to 50 characters long
ALTER TABLE stars
ALTER COLUMN name TYPE varchar(50);

-- Modify the `distance` column so that it allows fractional light years to any degree of precision required
ALTER TABLE stars
ALTER COLUMN distance TYPE numeric;

-- Check that the `spectral_type` should be required and is one of the following values: 'O', 'B', 'A', 'F', 'G', 'K', 'M'
ALTER TABLE stars
  ADD CHECK (spectral_type IN ('O', 'B', 'A', 'F', 'G', 'K', 'M')),
ALTER COLUMN spectral_type SET NOT NULL;

-- Remove the `CHECK` constraint for `spectral_type`
ALTER TABLE stars
DROP CONSTRAINT stars_spectral_type_check;

-- Create an enumerated type restricted to the values 'O', 'B', 'A', 'F', 'G', 'K', 'M'
CREATE TYPE spectral_type_enum AS ENUM ('O', 'B', 'A', 'F', 'G', 'K', 'M');

-- Modify the `spectral_type` column so it becomes an enumerated type restricted to 'O', 'B', 'A', 'F', 'G', 'K', 'M'
ALTER TABLE stars
ALTER COLUMN spectral_type
        TYPE spectral_type_enum
       USING spectral_type::spectral_type_enum;
