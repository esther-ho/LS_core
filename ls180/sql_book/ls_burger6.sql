/*
- Create a `customers` table to hold customer name data
- Create a `email_addresses` table to hold customer email data
- Create a one-to-one relationship between them
- If a customer record is deleted, the equivalent email address record is deleted
- Populate the tables with the data from the `orders` table
*/

CREATE TABLE customers (
  id serial PRIMARY KEY,
  customer_name varchar(100) NOT NULL
);

CREATE TABLE email_addresses (
  customer_id serial PRIMARY KEY,
  customer_email varchar(50) NOT NULL,
  FOREIGN KEY (customer_id) REFERENCES customers(id)
  ON DELETE CASCADE
);

INSERT INTO customers (customer_name)
VALUES ('James Bergman'),
       ('Natasha O''Shea'),
       ('Aaron Muller');

INSERT INTO email_addresses (customer_id, customer_email)
VALUES (1, 'james1998@email.com'),
       (2, 'natasha@osheafamily.com');

/*
- Create a separate `products` table with:
  - auto-incrementing `id` column acting as `PRIMARY KEY`
  - `product_name` column of type `varchar(50)`
  - `product_cost` column of monetary type less than $100
  - `product_type` column that hold strings of up to 20 characters
  - `product_loyalty_points` of type integer
- Insert data into the `products` table
*/

CREATE TABLE products (
  id serial PRIMARY KEY,
  product_name varchar(50),
  product_cost decimal(4,2) DEFAULT 0,
  product_type varchar(20),
  product_loyalty_points integer
);

INSERT INTO products (product_name, product_cost, product_type, product_loyalty_points)
VALUES ('LS Burger', 3.00, 'Burger', 10),
       ('LS Cheeseburger', 3.50, 'Burger', 15),
       ('LS Chicken Burger', 4.50, 'Burger', 20),
       ('LS Double Deluxe Burger', 6.00, 'Burger', 30),
       ('Fries', 1.20, 'Side', 3),
       ('Onion Rings', 1.50, 'Side', 5),
       ('Cola', 1.50, 'Drink', 5),
       ('Lemonade', 1.50, 'Drink', 5),
       ('Vanilla Shake', 2.00, 'Drink', 7),
       ('Chocolate Shake', 2.00, 'Drink', 7),
       ('Strawberry Shake', 2.00, 'Drink', 7);

/*
- Delete the `orders` table
- Create a new `orders` table with:
  - auto-incrementing `id` column
  - `customer_id` column that references the `id` column in the `customers` table
  - `order status` column that can hold strings of up to 20 characters
- Create an `order_items` table with:
  - `order_id` column that references the `id` column in the `orders` table
  - `product_id` column that references the `id` column in the `products` table
*/

DROP TABLE orders;

CREATE TABLE orders (
  id serial PRIMARY KEY,
  customer_id integer NOT NULL,
  order_status varchar(20),
  FOREIGN KEY (customer_id) REFERENCES customers(id)
  ON DELETE CASCADE
);

CREATE TABLE order_items (
  id serial PRIMARY KEY,
  order_id integer NOT NULL,
  product_id integer NOT NULL,
  FOREIGN KEY (order_id) REFERENCES orders(id)
  ON DELETE CASCADE,
  FOREIGN KEY (product_id) REFERENCES products(id)
  ON DELETE CASCADE
);

INSERT INTO orders (customer_id, order_status)
VALUES (1, 'In Progress'),
       (2, 'Placed'),
       (2, 'Complete'),
       (3, 'Placed');

INSERT INTO order_items (order_id, product_id)
VALUES (1, 3), (1, 5), (1, 6), (1, 8),
       (2, 2), (2, 5), (2, 7),
       (3, 4), (3, 2), (3, 5), (3, 5), (3, 6), (3, 10), (3, 9),
       (4, 1), (4, 5);
