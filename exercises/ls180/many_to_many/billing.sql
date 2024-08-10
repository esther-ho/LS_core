-- Create a `billing` database
CREATE DATABASE billing;

-- Connect to `billing` database
\c billing

/*
- Create a `customers` table with:
  - `id` column that auto-increments and serves as primary key
  - `name` column that stores customer's name; it is required and may contain strings of any length
  - `payment_token` column that stores a required unique 8-character string of solely uppercase alphabetic letters
*/
CREATE TABLE customers (
  id serial PRIMARY KEY,
  name text NOT NULL,
  payment_token char(8) UNIQUE NOT NULL,
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
  CHECK (price >= 0.00)
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

/*
- Create a join table that associates customers with services and vice-versa
- It should have a primary key `id` that auto-increments
- Deleting the customer record will automatically delete corresponding records in the join table
- Each customer-service combination should be unique
*/
CREATE TABLE customers_services (
  id serial PRIMARY KEY,
  customer_id integer NOT NULL,
  service_id integer NOT NULL,
  FOREIGN KEY (customer_id) REFERENCES customers(id)
  ON DELETE CASCADE,
  UNIQUE (customer_id, service_id)
);

-- Insert data into join table
INSERT INTO customers_services (customer_id, service_id)
VALUES (1, 1), (1, 2), (1, 3),
       (3, 1), (3, 2), (3, 3), (3, 4), (3, 5),
       (4, 1), (4, 4),
       (5, 1), (5, 2), (5, 6),
       (6, 1), (6, 6), (6, 7);

SELECT * FROM customers_services;

-- Return customer data for every customer subscribed to at least one service
SELECT DISTINCT c.*
  FROM customers AS c
  JOIN customers_services AS cs
    ON c.id = cs.customer_id;

SELECT *
  FROM customers
 WHERE id IN (
       SELECT customer_id
       FROM customers_services
 );

-- Return customer data for every customer who does not subscribe to any services
SELECT DISTINCT c.*
  FROM customers AS c
       LEFT JOIN customers_services AS cs
       ON c.id = cs.customer_id
 WHERE cs.service_id IS NULL;

SELECT *
  FROM customers
 WHERE id NOT IN (
       SELECT customer_id
       FROM customers_services
 );

-- Return all customers with no services and all services with no customers
SELECT c.*, s.*
  FROM customers AS c
       LEFT JOIN customers_services AS cs
       ON c.id = cs.customer_id
       FULL JOIN services AS s
       ON s.id = cs.service_id
 WHERE c.id IS NULL
    OR s.id IS NULL;

-- Return all services not currently in use (use a right outer join if using `JOIN`)
SELECT s.description
  FROM customers_services AS cs
       RIGHT JOIN services AS s
       ON s.id = cs.service_id
 WHERE cs.service_id IS NULL;

SELECT description
  FROM services
 WHERE id NOT IN (
       SELECT service_id
       FROM customers_services
 );

-- Display a list of all customer names with a comma-separated list of services they use
SELECT c.name, STRING_AGG(s.description, ', ') AS services
  FROM customers AS c
       LEFT JOIN customers_services AS cs
       ON c.id = cs.customer_id
       LEFT JOIN services AS s
       ON s.id = cs.service_id
 GROUP BY c.id;

-- Modify the above query so that each new service is on a new line
SELECT CASE lag(c.name) OVER (ORDER BY c.name)
       WHEN c.name THEN ''
       ELSE c.name
       END,
       s.description
  FROM customers AS c
       LEFT JOIN customers_services AS cs
       ON c.id = cs.customer_id
       LEFT JOIN services AS s
       ON s.id = cs.service_id;

-- Return a description for every service subscribed to by at least 3 customers and include the customer count
SELECT s.description, COUNT(cs.customer_id)
  FROM services AS s
  JOIN customers_services AS cs
    ON s.id = cs.service_id
 GROUP BY s.id
HAVING COUNT(cs.customer_id) >= 3;

-- Compute the total gross income expected
SELECT SUM(s.price) AS gross
  FROM services AS s
  JOIN customers_services AS cs
    ON s.id = cs.service_id;
