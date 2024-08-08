/* 
- Add a `class` column to the `animals` table to hold strings up to 100 characters
- Update all rows in the table so that `class` holds the value 'Aves'
*/
ALTER TABLE animals
 ADD COLUMN class varchar(100);

UPDATE animals
   SET class = 'Aves';

/*
- Add two columns, `phylum` and `kingdom` to the `animals` table
- Both columns can hold strings up to 100 characters
- Update all rows so that `phylum` holds the value 'Chordata'
- Update all rows so that `kingdom` holds the value 'Animalia'
*/
ALTER TABLE animals
 ADD COLUMN phylum varchar(100),
 ADD COLUMN kingdom varchar(100);

UPDATE animals
   SET phylum = 'Chordata',
       kingdom = 'Animalia';

/*
- Add a `continent` column to the `countries` table to hold strings up to 50 characters
- Update all rows so that:
  - France and Germany have a value of 'Europe'
  - Japan has a value of 'Asia'
  - USA has a value of 'North America'
*/
ALTER TABLE countries
 ADD COLUMN continent varchar(50);

UPDATE countries
   SET continent = 'Europe'
 WHERE name = 'France'
    OR name = 'Germany';

UPDATE countries
   SET continent = 'Asia'
 WHERE name = 'Japan';

UPDATE countries
   SET continent = 'North America'
 WHERE name = 'USA;'

/*
- Update the Elvis row so that the value is `deceased` is true
- Change the column so it no longer allows `NULL` values
*/
UPDATE celebrities
   SET deceased = true
 WHERE first_name = 'Elvis'
   AND last_name = 'Presley';

ALTER TABLE celebrities
 ALTER COLUMN deceased SET NOT NULL;

-- Remove Tom Cruise from the `celebrities` table
DELETE FROM celebrities
      WHERE first_name = 'Tom'
        AND last_name = 'Cruise';

/*
- Change the name of the `celebrities` table to `singers`
- Remove anyone who isn't a singer
*/
ALTER TABLE celebrities
  RENAME TO singers;

DELETE FROM singers
      WHERE occupation NOT LIKE '%Singer%';

-- Remove all rows from the `countries` table
DELETE FROM countries;
