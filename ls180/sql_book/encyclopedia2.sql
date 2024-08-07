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

