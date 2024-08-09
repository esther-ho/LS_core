-- Create a `workshop` database
CREATE DATABASE workshop;

-- Connect to `workshop` database
\c

-- Delete tables if they exist
DROP TABLE IF EXISTS devices, parts;

/*
- Create a `devices` table with:
  - `id` column that is auto-incrementing and a primary key
  - `name` column that can contain a string and is required
  - `created_at` column that lists the `timestamp` the device was created and should have a default value
*/
CREATE TABLE devices (
  id serial PRIMARY KEY,
  name text NOT NULL,
  created_at timestamp DEFAULT NOW()
);

/*
- Create a `parts` table with:
  - `id` column that is auto-incrementing and a primary key
  - `part_number` column that contains unique and not-null values
  - `device_id` column that is a foreign key referencing `devices.id`
- Each device should have many different parts
- Each part is unique to each device
*/
CREATE TABLE parts (
  id serial PRIMARY KEY,
  part_number integer UNIQUE NOT NULL,
  device_id integer REFERENCES devices(id)
);

-- Insert data for `devices` and `parts` tables
INSERT INTO devices (name)
VALUES ('Accelerometer'),
       ('Gyroscope');

INSERT INTO parts (part_number, device_id)
VALUES (GENERATE_SERIES(5, 7), 1);

INSERT INTO parts (part_number, device_id)
VALUES (GENERATE_SERIES(50, 54), 2);

INSERT INTO parts (part_number)
VALUES (GENERATE_SERIES(35, 37));

SELECT * FROM devices;
SELECT * FROM parts;
