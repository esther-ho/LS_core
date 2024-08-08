-- Change the drink on James Bergman's order from a Cola to a Lemonade
UPDATE orders
   SET drink = 'Lemonade'
 WHERE id = 1;

-- Add Fries to Aaron Muller's order, and add the cost ($0.99) and 3 loyalty points to the total
UPDATE orders
   SET side = 'Fries',
       side_cost = 0.99,
       customer_loyalty_points = 13
 WHERE id = 4;

-- Update the table to reflect the increased cost of Fries to $1.20
UPDATE orders
   SET side_cost = 1.20
 WHERE side = 'Fries';
