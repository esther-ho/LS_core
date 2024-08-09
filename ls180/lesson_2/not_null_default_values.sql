-- Create an `employees` table
DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    first_name character varying(100),
    last_name character varying(100),
    department character varying(100),
    vacation_remaining integer
);

-- Insert data into `employees` table
INSERT INTO employees VALUES ('Leonardo', 'Ferreira', 'finance', 14);
INSERT INTO employees VALUES ('Sara', 'Mikaelsen', 'operations', 14);
INSERT INTO employees VALUES ('Lian', 'Ma', 'marketing', 13);

-- Insert data into `employees` table with `NULL` values
INSERT INTO employees (first_name, last_name) VALUES ('Haiden', 'Smith');

-- Attempting to sort data using a column containing `NULL` values causes arbitrary ordering
SELECT *
  FROM employees
 ORDER BY vacation_remaining DESC;

SELECT *, vacation_remaining * 15.50 * 8 AS amount
  FROM employees
 ORDER BY vacation_remaining DESC;

-- Add a `NOT NULL` constraint to a column is not possible if it contains `NULL` values
ALTER TABLE employees
 ALTER COLUMN vacation_remaining SET NOT NULL;

-- Remove row with `NULL` values
DELETE FROM employees
      WHERE vacation_remaining IS NULL;

-- Add `NOT NULL` constraint to the `vacation_remaining` column
ALTER TABLE employees
 ALTER COLUMN vacation_remaining SET NOT NULL;

-- Define a default value for the `vacation_remaining` column
ALTER TABLE employees
 ALTER COLUMN vacation_remaining SET DEFAULT 0;

-- When inserting a row that doesn't provide a value for `vacation_remaining`, the `DEFAULT` value is used
INSERT INTO employees (first_name, last_name) VALUES ('Haiden', 'Smith');

-- Return all records from the `employees` table
SELECT * FROM employees;

-- Sorting using `vacation_remaining` now works
SELECT *
  FROM employees
 ORDER BY vacation_remaining DESC;

SELECT *, vacation_remaining * 15.50 * 8 AS amount
  FROM employees
 ORDER BY vacation_remaining DESC;

/*
- Set the default value of `department` column to 'unassigned'
- Set the value of the `department` column to 'unassigned' for any rows with a `NULL` value
- Add a `NOT NULL` constraint to the `department` column
*/
ALTER TABLE employees
 ALTER COLUMN department SET DEFAULT 'unassigned';

UPDATE employees
   SET department = 'unassigned'
 WHERE department IS NULL;

ALTER TABLE employees
 ALTER COLUMN department SET NOT NULL;

/*
- Create a `temperatures` table with:
  - `date` column
  - `low` column holding integer values
  - `high` column holding integer values
- All rows should always contain all three values
*/
DROP TABLE IF EXISTS temperatures, weather;

CREATE TABLE temperatures (
  date date NOT NULL,
  low integer NOT NULL,
  high integer NOT NULL
);

-- Insert data into `temperatures` table
INSERT INTO temperatures (date, low, high)
VALUES ('2016-03-01', 34, 43),
       ('2016-03-02', 32, 44),
       ('2016-03-03', 31, 47),
       ('2016-03-04', 33, 42),
       ('2016-03-05', 39, 46),
       ('2016-03-06', 32, 43),
       ('2016-03-07', 29, 32),
       ('2016-03-08', 23, 31),
       ('2016-03-09', 17, 28);

-- Determine the average temperature (round to 1 decimal place) for each day from March 2, 2016 through March 8, 2016
SELECT date, ROUND((low + high) / 2.0, 1) AS average
  FROM temperatures
 WHERE date BETWEEN '2016-03-02' AND '2016-03-08';

-- Add a new column `rainfall` to the `temperatures` table, storing values in mm and with a default value of `0
ALTER TABLE temperatures
 ADD COLUMN rainfall integer DEFAULT 0;

-- Update the `rainfall` column so that it rains 1mm per 1 degree the average temperature goes above 35
UPDATE temperatures
   SET rainfall = ((low + high) / 2) - 35
 WHERE (low + high) / 2 > 35;

-- Return all records from the `temperatures` table
SELECT * FROM temperatures;

-- Modify `rainfall` column so that it stores values in inches
ALTER TABLE temperatures
 ALTER COLUMN rainfall TYPE decimal(7,3);

UPDATE temperatures
   SET rainfall = rainfall * 0.039;

-- Return all records from the `temperatures` table
SELECT * FROM temperatures;

-- Rename the `temperatures` table to `weather`
ALTER TABLE temperatures
  RENAME TO weather;

-- Describe the structure of `weather`
\d weather
