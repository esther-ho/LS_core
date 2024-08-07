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

