/*
- Create a `people` table with:
  - `name` column containing strings of varying length
  - `age` column containing integers
  - `occupation` column containing strings of varying length
*/
CREATE TABLE people (
  name varchar(100),
  age integer,
  occupation varchar(100)
);

-- Insert data into `people` table
INSERT INTO people (name, age, occupation)
VALUES ('Abby', 34, 'biologist'),
       ('Mu''nisah', 26, NULL),
       ('Mirabelle', 40, 'contractor');

-- Return records from the `people` table (to check that data was inserted)
SELECT * FROM people;

-- Write 3 SQL queries that can be used to retrieve the second row of the `people` table
SELECT *
  FROM people
 WHERE name = 'Mu''nisah';

SELECT *
  FROM people
 WHERE age = 26;

SELECT *
  FROM people
 WHERE occupation IS NULL;

/*
- Create a table `birds` with:
  - `name` column with strings of varying length
  - `length` column with fractional numbers with one decimal digit
  - `wingspan` column with one decimal digit
  - `family` column with strings of varying length
  - `extinct` column with boolean values
*/
CREATE TABLE birds (
  name varchar(100),
  length decimal(4,1),
  wingspan decimal(4,1),
  family varchar(100),
  extinct boolean
);

-- Insert data into the `birds` table
INSERT INTO birds (name, length, wingspan, family, extinct)
VALUES ('Spotted Towhee', 21.6, 26.7, 'Emberizidae', false),
       ('American Robin', 25.5, 36.0, 'Turdidae', false),
       ('Greater Koa Finch', 19.0, 24.0, 'Fringillidae', true),
       ('Carolina Parakeet', 33.0, 55.8, 'Psittacidae', true),
       ('Common Kestrel', 35.5, 73.5, 'Falconidae', false);

-- Return records from the `birds` table (to check that data was inserted)
SELECT * FROM birds;

-- Return the names and families for all birds that are not extinct, in order from longest to shortest
SELECT name, family
  FROM birds
 WHERE extinct = false
 ORDER BY length DESC;

-- Return the average, minimum, and maximum wingspan for the birds
SELECT ROUND(AVG(wingspan), 1),
       MIN(wingspan),
       MAX(wingspan)
  FROM birds;

/*
- Create a `menu_items` table with:
  - `item` column containing strings of varying length
  - `prep_time` column containing integers
  - `ingredient_cost` column containing a monetary value
  - `sales` column containing an integer
  - `menu_price` column containing a monetary value
*/
CREATE TABLE menu_items (
  item varchar(100),
  prep_time integer,
  ingredient_cost decimal(5,2),
  sales integer,
  menu_price decimal(5,2)
);

-- Insert the data into the `menu_items` table
INSERT INTO menu_items (item, prep_time, ingredient_cost, sales, menu_price)
VALUES ('omelette', 10, 1.50, 182, 7.99),
       ('tacos', 5, 2.00, 254, 8.99),
       ('oatmeal', 1, 0.50, 79, 5.99);

-- Return records from the `menu_items` table (to check that data was inserted)
SELECT * FROM menu_items;

-- Return the name of the item that is most profitable and its profit
SELECT item, (menu_price - ingredient_cost) AS profit
  FROM menu_items
 ORDER BY profit DESC
 LIMIT 1;

/*
- Determine how profitable each item is based on the amount of time taken to prepare one item
- Assure whoever is preparing the food is being paid $13 an hour
- `prep_time` is represented in minutes
*/
SELECT item,
       menu_price,
       ingredient_cost,
       ROUND(prep_time / 60.0 * 13,2) AS labor,
       (menu_price - ingredient_cost - ROUND(prep_time / 60.0 * 13,2)) AS profit
  FROM menu_items
 ORDER BY profit DESC;
