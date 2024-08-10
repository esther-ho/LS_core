-- Create a new `auction` database
CREATE DATABASE auction;

-- Connect to `auction` database
\c auction

/*
- Create a `bidders` table with:
  - `id` serial column that serves as a primary key
  - `name` text column that is `NOT NULL`
*/
CREATE TABLE bidders (
  id serial PRIMARY KEY,
  name text NOT NULL
);

/*
- Create an `items` table with:
  - `id` serial column that serves as a primary key
  - `name` text column that is `NOT NULL`
  - `initial_price` numeric column that is `NOT NULL`
  - `sales_price` numeric column that can be `NULL`

- Both `initial_price` and `sales_price` should be able to hold a positive number as high as 1000 dollars with 2 decimal points of precision
*/
CREATE TABLE items (
  id serial PRIMARY KEY,
  name text NOT NULL,
  initial_price numeric(6,2) NOT NULL,
  sales_price numeric(6,2),
  CHECK (initial_price BETWEEN 0.01 AND 1000.00),
  CHECK (sales_price BETWEEN 0.01 AND 1000.00)
);

/*
- Create a `bids` table with:
  - `id` serial column that servces as a primary key
  - `bidder_id` integer column that is `NOT NULL`
  - `item_id` integer column that is `NOT NULL`
  - `amount` numeric column similar to `initial_price` column

- `bidder_id` should be associated with the `bidders` table
- `item_id` should be associated with the `items` table
- If the item or bidder associated with a bid is removed, the bid should also be removed
- `bidder_id` and `item_id` together should form a composite index
*/
CREATE TABLE bids (
  id serial PRIMARY KEY,
  bidder_id integer NOT NULL,
  item_id integer NOT NULL,
  amount numeric(6,2) NOT NULL,
  CHECK (amount BETWEEN 0.01 AND 1000.00),
  FOREIGN KEY (bidder_id) REFERENCES bidders(id)
  ON DELETE CASCADE,
  FOREIGN KEY (item_id) REFERENCES items(id)
  ON DELETE CASCADE
);

CREATE INDEX ON bids (bidder_id, item_id);

\d bidders
\d items
\d bids

-- Import data from *.csv files
\copy bidders FROM 'bidders.csv' WITH CSV HEADER;
\copy items FROM 'items.csv' WITH CSV HEADER;
\copy bids FROM 'bids.csv' WITH CSV HEADER;

SELECT * FROM bidders;
SELECT * FROM items;
SELECT * FROM bids;

-- Return all items that have had bids on them; use the `IN` operator
SELECT name AS "Bid on Items"
  FROM items
 WHERE id IN (
       SELECT DISTINCT item_id
       FROM bids
 );

-- Return all items that have not had bids on them; use the `NOT IN` operator
SELECT name AS "Not Bid On"
  FROM items
 WHERE id NOT IN (
       SELECT DISTINCT item_id
       FROM bids
 );

-- Return a list of names of people who has bid in the auction; use the `EXISTS` operator
SELECT bidders.name
  FROM bidders
 WHERE EXISTS (
       SELECT 1
       FROM bids
       WHERE bidders.id = bids.bidder_id
 );

-- Return the above with a `JOIN` clause
SELECT bidders.name
  FROM bidders
  JOIN bids
    ON bidders.id = bids.bidder_id
 GROUP BY bidders.id
 ORDER BY bidders.id;

-- Find the largest number of bids from an individual bidder; use a subquery to generate a result table and query that table
SELECT MAX(bid_counts.count)
  FROM (SELECT COUNT(id)
        FROM bids
        GROUP BY bidder_id)
        AS bid_counts;

-- Return the number of bids on each item; use a scalar subquery that returns one column for each row
SELECT items.name, (
       SELECT COUNT(bids.item_id)
       FROM bids
       WHERE items.id = bids.item_id
       )
FROM items;

-- Return the above with a `LEFT OUTER JOIN` clause
SELECT items.name, COUNT(bids.item_id)
  FROM items
       LEFT OUTER JOIN bids
       ON items.id = bids.item_id
 GROUP BY items.id
 ORDER BY items.id;

-- Display the `id` for an item that matches all the data without the `AND` keyword; use row constructors
SELECT id
  FROM items
 WHERE ROW(name, initial_price, sales_price)
       = ROW('Painting', 100.00, 250.00);

-- Return the query plan for the following query
EXPLAIN SELECT name FROM bidders
         WHERE EXISTS (
               SELECT 1
               FROM bids
               WHERE bidders.id = bids.bidder_id
         );

EXPLAIN ANALYZE
SELECT name FROM bidders
 WHERE EXISTS (
       SELECT 1
       FROM bids
       WHERE bidders.id = bids.bidder_id
);

-- Compare the following two queries
EXPLAIN ANALYZE
SELECT MAX(bid_counts.count)
  FROM (SELECT COUNT(bids.id)
          FROM bids
         GROUP BY bids.bidder_id)
       AS bid_counts;

EXPLAIN ANALYZE
SELECT COUNT(id) AS max
  FROM bids
 GROUP BY bidder_id
 ORDER BY max DESC
 LIMIT 1;
