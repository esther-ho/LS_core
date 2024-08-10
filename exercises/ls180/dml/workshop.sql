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

-- Display all devices and the parts that make them up - display the `name` and `part_number`
SELECT d.name, p.part_number
  FROM devices AS d
       INNER JOIN parts AS p
       ON d.id = p.device_id;

SELECT d.name, p.part_number
  FROM devices AS d, parts AS p
 WHERE d.id = p.device_id;

-- Return all parts that have a `part_number` that starts with 3
SELECT *
  FROM parts
 WHERE part_number::text LIKE '3%';

-- Return the name of each device and the number of parts for that device
SELECT d.name, COUNT(p.id)
  FROM devices AS d
       LEFT JOIN parts AS p
       ON d.id = p.device_id
 GROUP BY d.id;

-- Return the above but list the devices in descending alphabetical order
SELECT d.name, COUNT(p.id)
  FROM devices AS d
       LEFT JOIN parts AS p
       ON d.id = p.device_id
 GROUP BY d.id
 ORDER BY d.name DESC;

-- Generate a listing of parts that currently belong to a device; don't include the `id` column
SELECT part_number, device_id
  FROM parts
 WHERE device_id IS NOT NULL;

-- Generate a listing of parts that don't belong to a device; don't include the `id` column
SELECT part_number, device_id
  FROM parts
 WHERE device_id IS NULL;

-- Insert more data into the `devices` and `parts` tables
INSERT INTO devices (name)
VALUES ('Magnetometer');

INSERT INTO parts (part_number, device_id)
VALUES (42, 3);

SELECT * FROM devices;
SELECT * FROM parts;

-- Return the name of the oldest device from the `devices` table (assuming only 1 device)
SELECT name
  FROM devices
 ORDER BY created_at ASC
 LIMIT 1;

-- Return the name of the oldest device, assuming there might be 1 or more devices
SELECT name
  FROM devices
 WHERE created_at = (
       SELECT created_at
         FROM devices
        ORDER BY created_at ASC
        LIMIT 1
 );
