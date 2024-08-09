-- Pipe SQL file into database
--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

ALTER TABLE ONLY public.films DROP CONSTRAINT title_unique;
DROP TABLE public.films;
DROP EXTENSION plpgsql;
DROP SCHEMA public;
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA public;


--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: films; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE films (
    title character varying(255) NOT NULL,
    year integer NOT NULL,
    genre character varying(100) NOT NULL,
    director character varying(255) NOT NULL,
    duration integer NOT NULL,
    CONSTRAINT director_name CHECK (((length((director)::text) >= 1) AND ("position"((director)::text, ' '::text) > 0))),
    CONSTRAINT title_length CHECK ((length((title)::text) >= 1)),
    CONSTRAINT year_range CHECK (((year >= 1900) AND (year <= 2100)))
);


--
-- Data for Name: films; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO films VALUES ('Die Hard', 1988, 'action', 'John McTiernan', 132);
INSERT INTO films VALUES ('Casablanca', 1942, 'drama', 'Michael Curtiz', 102);
INSERT INTO films VALUES ('The Conversation', 1974, 'thriller', 'Francis Ford Coppola', 113);
INSERT INTO films VALUES ('1984', 1956, 'scifi', 'Michael Anderson', 90);
INSERT INTO films VALUES ('Tinker Tailor Soldier Spy', 2011, 'espionage', 'Tomas Alfredson', 127);
INSERT INTO films VALUES ('The Birdcage', 1996, 'comedy', 'Mike Nichols', 118);


--
-- PostgreSQL database dump complete
--

-- Add data into `films` table
INSERT INTO films(title, year, genre, director, duration) VALUES ('Godzilla', 1998, 'scifi', 'Roland Emmerich', 139);
INSERT INTO films(title, year, genre, director, duration) VALUES ('Godzilla', 2014, 'scifi', 'Gareth Edwards', 123);

-- Return all records from `films` table
SELECT * FROM films;

-- Make a new sequence called `counter`
CREATE SEQUENCE counter;

-- Retrieve the next values from `counter`
SELECT nextval('counter');

-- Remove a sequence called `counter`
DROP SEQUENCE counter;

-- Create a sequence that returns only even numbers
DROP SEQUENCE IF EXISTS even_counter;

CREATE SEQUENCE even_counter
   INCREMENT BY 2
       MINVALUE 2;

SELECT nextval('even_counter');
SELECT nextval('even_counter');

-- Add an auto-incrementing integer primary key column to the `films` table
ALTER TABLE films
 ADD COLUMN id serial PRIMARY KEY;

-- Display schema and records of `films` table
\d films
SELECT * FROM films;

-- An error is thrown if a row is updated to have a value of `id` already being used by another row
UPDATE films
   SET id = 1
 WHERE id = 3;

-- An error is thrown when attempting to add another primary key column
ALTER TABLE films
 ADD COLUMN other_id serial PRIMARY KEY;

-- Remove the primary key from the `id` column while preserving its values
ALTER TABLE films
 DROP CONSTRAINT films_pkey;

-- Display schema and records of `films` table
\d films
SELECT * FROM films;
