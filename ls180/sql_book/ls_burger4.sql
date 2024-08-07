-- Return all burgers that have been ordered that cost less than $5.00, ordered from cheapest to most expensive
SELECT burger
  FROM orders
 WHERE burger_cost < 5.00
 ORDER BY burger_cost;

 /* Return the customer name, email address, and loyalty points from any order worth 20 or more loyalty points, ordered from highest to lowest number of points */
SELECT customer_name, customer_email, customer_loyalty_points
  FROM orders
 WHERE customer_loyalty_points >= 20
 ORDER BY customer_loyalty_points DESC;

-- Return all burgers ordered by Natasha O'Shea
SELECT burger
  FROM orders
 WHERE customer_name = 'Natasha O''Shea';

-- Return the customer name from any order that does not include a drink item
SELECT customer_name
  FROM orders
 WHERE drink IS NULL;

-- Return the three meal items for any order that does not include fries
SELECT burger, side, drink
  FROM orders
 WHERE side <> 'Fries'
    OR side IS NULL;

-- Return the three meal items for any order that includes both a side and a drink
SELECT burger, side, drink
  FROM orders
 WHERE side IS NOT NULL
   AND drink IS NOT NULL;
