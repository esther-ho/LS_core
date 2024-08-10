-- Create a `billing` database
CREATE DATABASE billing;

-- Connect to `billing` database
\c billing

/*
- Create a `customers` table with:
  - `id` column that auto-increments and serves as primary key
  - `name` column that stores customer's name; it is required and may contain strings of any length
  - `payment_token` column that stores a required 8-character string of solely uppercase alphabetic letters
*/
CREATE TABLE customers (
  id serial PRIMARY KEY,
  name text NOT NULL,
  payment_token char(8) NOT NULL,
  CHECK (payment_token ~ '^[A-Z]+$')
);

/*
- Create a `services` table with:
  - `id` column that auto-increments and serves as primary key
  - `description` column that holds the service description; it is required and may contain any text
  - `price` column that holds the annual service price; it is required, must be greater than or equal to '0.00'
    - the data type for `price` is `numeric(10,2)`
*/
CREATE TABLE services (
  id serial PRIMARY KEY,
  description text NOT NULL,
  price numeric(10,2) NOT NULL,
  CHECK (price >= 0.0)
);

\d customers
\d services

-- Insert data into tables
INSERT INTO customers (name, payment_token)
VALUES ('Pat Johnson', 'XHGOAHEQ'),
       ('Nancy Monreal', 'JKWQPJKL'),
       ('Lynn Blake', 'KLZXWEEE'),
       ('Chen Ke-Hua', 'KWETYCVX'),
       ('Scott Lakso', 'UUEAPQPS'),
       ('Jim Pornot', 'XKJEYAZA');

INSERT INTO services (description, price)
VALUES ('Unix Hosting', 5.95),
       ('DNS', 4.95),
       ('Whois Registration', 1.95),
       ('High Bandwidth', 15.00),
       ('Business Support', 250.00),
       ('Dedicated Hosting', 50.00),
       ('Bulk Email',  250.00),
       ('One-to-one Training', 999.00);

SELECT * FROM customers;
SELECT * FROM services;
