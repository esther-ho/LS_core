-- Return the population of the USA
SELECT population
  FROM countries
 WHERE name = 'USA';

-- Return the population and the capital of all countries
SELECT population, capital
  FROM countries;

-- Return the names of all countries ordered alphabetically
SELECT name
  FROM countries
 ORDER BY name;

-- Return the names and capitals of all countries in the order of population, from lowest to highest
SELECT name, capital
  FROM countries
 ORDER BY population;

-- Return the above but orderered from highest to lowest
SELECT name, capital
  FROM countries
 ORDER BY population DESC;

/*
Return the name, binomial name, max weight, and max age of animals ordered by:
- Max age in ascending order
- Max weight in ascending order
- Name in descending order
*/
SELECT name, binomial_name, max_weight_kg, max_age_years
  FROM animals
 ORDER BY max_age_years, max_weight_kg, name DESC;

-- Return the names of all countries with a population greater than 70 million
SELECT name
  FROM countries
 WHERE population > 70000000;

-- Return the names of all countries with a population greater than 70 million but less than 200 million
SELECT name
  FROM countries
 WHERE population > 70000000
   AND population < 200000000;

-- Return the first and last name of all celebrities where the value of the deceased column is not true
SELECT first_name, last_name
  FROM celebrities
 WHERE deceased <> true
    OR deceased IS NULL;

-- Return the first and last names of all celebrities who sing
SELECT first_name, last_name
  FROM celebrities
 WHERE occupation LIKE '%Singer%';

-- Return the first and last names of all celebrities who act
SELECT first_name, last_name
  FROM celebrities
 WHERE occupation LIKE '%Actor%'
    OR occupation LIKE '%Actress%';

-- Return the first and last names of all celebrities who both sing and act
SELECT first_name, last_name
  FROM celebrities
 WHERE occupation LIKE '%Singer%'
   AND (occupation LIKE '%Actor%' OR occupation LIKE '%Actress%');

-- Return the first row of data from the `countries` table
SELECT *
  FROM countries
 LIMIT 1;

-- Return the name of the country with the largest population
SELECT name
  FROM countries
 ORDER BY population DESC
 LIMIT 1;

-- Return the name of the country with the second largest population
SELECT name
  FROM countries
 ORDER BY population DESC
 LIMIT 1
OFFSET 1;

-- Return all unique values from the `binomial_name` column of the `animals` table
SELECT DISTINCT binomial_name
  FROM animals;

-- Return the longest binomial name from the `animals` table
SELECT binomial_name
  FROM animals
 ORDER BY LENGTH(binomial_name) DESC
 LIMIT 1;

-- Return the first name of any celebrity born in 1958
SELECT first_name
  FROM celebrities
 WHERE DATE_PART('year', date_of_birth) = '1958';

-- Return the highest maximum age from the `animals` table
SELECT MAX(max_age_years)
  FROM animals;

-- Return the average maximum weight from the `animals` table
SELECT AVG(max_weight_kg)
  FROM animals;

-- Return the number of rows in the `countries` table
SELECT COUNT(id)
  FROM countries;

-- Return the total population of all countries in the `countries` table
SELECT SUM(population)
  FROM countries;

-- Return each unique conservation status code alongside the number of animals that have that code
SELECT conservation_status, COUNT(id)
  FROM animals
 GROUP BY conservation_status;
