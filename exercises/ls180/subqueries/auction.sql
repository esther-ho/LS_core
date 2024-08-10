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
