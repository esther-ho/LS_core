-- Rename `famous_people` table to `celebrities`
ALTER TABLE famous_people
  RENAME TO celebrities;

-- Rename `name` column to `first_name` and change type to `varchar(80)`
ALTER TABLE celebrities
  RENAME COLUMN name TO first_name;

ALTER TABLE celebrities
  ALTER COLUMN first_name TYPE varchar(80);

-- Add `last_name` column that can hold a string up to 100 characters and must have a value
ALTER TABLE celebrities
  ADD COLUMN last_name varchar(100) NOT NULL;

-- Change `date_of_birth` column type to hold a date and ensure it must have a value
ALTER TABLE celebrities
  ALTER COLUMN date_of_birth TYPE date
    USING date_of_birth::date,
  ALTER COLUMN date_of_birth SET NOT NULL;

-- Change `max_weight_kg` so it can hold values in the range of 0.0001kg to 200,000kg
ALTER TABLE animals
  ALTER COLUMN max_weight_kg TYPE decimal(10,4);

-- `binomial_name` column must not contain duplicate values
ALTER TABLE animals
  ADD UNIQUE (binomial_name);

-- Add data to `countries` table
INSERT INTO countries (name, capital, population)
VALUES ('France', 'Paris', 67158000),
       ('USA', 'Washington D.C.', 325365189),
       ('Germany', 'Berlin', 82349400),
       ('Japan', 'Tokyo', 126672000);

-- Add data to `celebrities` table
INSERT INTO celebrities (first_name, last_name, occupation, date_of_birth, deceased)
VALUES ('Bruce', 'Springsteen', 'Singer, Songwriter', '1949-09-23', false),
       ('Scarlett', 'Johansson', 'Actress', '1984-11-22', DEFAULT),
       ('Frank', 'Sinatra', 'Singer, Actor', '1915-12-12', true),
       ('Tom', 'Cruise', 'Actor', '1962-07-03', DEFAULT);

-- DROP `NOT NULL` constraint from `last_name` column
ALTER TABLE celebrities
  ALTER COLUMN last_name DROP NOT NULL;

-- Add data to `celebrities` table for celebrities with no last name
INSERT INTO celebrities (first_name, occupation, date_of_birth, deceased)
VALUES ('Madonna', 'Singer, Actress', '1958-08-16', false),
       ('Prince', 'Singer, Songwriter, Musician, Actor', '1958-06-07', true);

-- Add data to `celebrities` table with `NULL` value in `deceased` column
INSERT INTO celebrities (first_name, last_name, occupation, date_of_birth, deceased)
VALUES ('Elvis', 'Presley', 'Singer, Musician, Actor', '1935-01-08', NULL);

-- Drop `UNIQUE` constraint from `binomial_name` column in `animals` table
ALTER TABLE animals
  DROP CONSTRAINT animals_binomial_name_key;

-- Insert data into `animals` table
INSERT INTO animals (name, binomial_name, max_weight_kg, max_age_years, conservation_status)
VALUES ('Dove', 'Columbidae Columbiformes', 2, 15, 'LC'),
       ('Golden Eagle', 'Aquila Chrysaetos', 6.35, 24, 'LC'),
       ('Peregrine Falcon', 'Falco Peregrinus', 1.5, 15, 'LC'),
       ('Pigeon', 'Columbidae Columbiformes', 2, 15, 'LC'),
       ('Kakapo', 'Strigops habroptila', 4, 60, 'CR');
