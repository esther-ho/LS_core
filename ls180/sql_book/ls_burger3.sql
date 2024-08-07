/*
Add `customer_email` column to hold strings up to 50 characters
Add `customer_loyalty_points` column to hold integer values, apply `0` if no value is given
*/
ALTER TABLE orders
  ADD COLUMN customer_email varchar(50),
  ADD COLUMN customer_loyalty_points integer DEFAULT 0;

/*
Add `burger_cost`, `side_cost`, and `drink_cost` to hold monetary values assuming less than $100
If no value is entered, use `0` dollars
*/
ALTER TABLE orders
  ADD COLUMN burger_cost decimal(4,2) DEFAULT 0,
  ADD COLUMN side_cost decimal(4,2) DEFAULT 0,
  ADD COLUMN drink_cost decimal(4,2) DEFAULT 0;

-- Remove `order_total` column from the `orders` table
ALTER TABLE orders
  DROP COLUMN order_total;

-- Insert data into `orders` table
INSERT INTO orders (customer_name, customer_email, customer_loyalty_points,
                    burger, side, drink, burger_cost, side_cost, drink_cost)
VALUES ('James Bergman', 'james1998@email.com', (20 + 3 + 5),
        'LS Chicken Burger','Fries', 'Cola', 4.50, 0.99, 1.50),
       ('Natasha O''Shea', 'natasha@osheafamily.com', (15 + 3),
        'LS Cheeseburger', 'Fries', NULL, 3.50, 0.99, DEFAULT),
       ('Natasha O''Shea', 'natasha@osheafamily.com', (30 + 5 + 7),
        'LS Double Deluxe Burger', 'Onion Rings', 'Chocolate Shake', 6.00, 1.50, 2.00),
       ('Aaron Muller', NULL, 10,
        'LS Burger', NULL, NULL, 3.00, DEFAULT, DEFAULT);
