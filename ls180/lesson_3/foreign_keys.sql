-- Pipe SQL data into database

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

ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_product_id_fkey;
ALTER TABLE ONLY public.products DROP CONSTRAINT products_pkey;
ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey;
ALTER TABLE public.products ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.orders ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE public.products_id_seq;
DROP TABLE public.products;
DROP SEQUENCE public.orders_id_seq;
DROP TABLE public.orders;
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
-- Name: orders; Type: TABLE; Schema: public; Owner: -; Tablespace:
--

CREATE TABLE orders (
    id integer NOT NULL,
    product_id integer,
    quantity integer NOT NULL
);


--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE orders_id_seq OWNED BY orders.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: -; Tablespace:
--

CREATE TABLE products (
    id integer NOT NULL,
    name text NOT NULL
);


--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE products_id_seq OWNED BY products.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY orders ALTER COLUMN id SET DEFAULT nextval('orders_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY products ALTER COLUMN id SET DEFAULT nextval('products_id_seq'::regclass);


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('orders_id_seq', 1, false);


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('products_id_seq', 1, false);


--
-- Name: orders_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace:
--

ALTER TABLE ONLY orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: products_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace:
--

ALTER TABLE ONLY products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);

--
-- PostgreSQL database dump complete
--

-- Display all tables in database
\dt

-- Display schema of the `orders` and `products` tables
\d orders
\d products

-- Update the `orders` table to preserve the referential integrity for data between `orders` and `products`
ALTER TABLE orders
  ADD FOREIGN KEY (product_id) REFERENCES products(id);

-- Display schema of the `orders` and `products` tables
\d orders
\d products

-- Insert data into the `orders` and `products` tables
INSERT INTO products (name)
VALUES ('small bolt'),
       ('large bolt');

INSERT INTO orders (product_id, quantity)
VALUES (1, 10),
       (1, 25),
       (2, 15);

-- Display all records in the `orders` and `products` tables
SELECT * FROM orders;

SELECT * FROM products;

-- Return the quantity and name of product in each order
SELECT o.quantity, p.name
  FROM orders AS o
  JOIN products AS p
    ON o.product_id = p.id;

-- Can you insert a row into `orders` without a `product_id`? Yes, because there is no `NOT NULL` constraint for the `product_id` column.
INSERT INTO orders (quantity)
VALUES (10);

SELECT * FROM orders;

-- Add a SQL statement that prevents `NULL` values from being stored in `orders.product_id` - this throws an error because there is a `NULL` value present in the column
ALTER TABLE orders
ALTER COLUMN product_id SET NOT NULL;

-- Make changes to avoid the error message encountered in the above step
DELETE FROM orders
 WHERE product_id IS NULL;

ALTER TABLE orders
ALTER COLUMN product_id SET NOT NULL;

-- Display schema of the `orders` table
\d orders

/*
- Create a new table called `reviews` with:
  - primary key
  - a reference to the `products` table
  - a `body` column that contains text
*/
CREATE TABLE reviews (
  id serial PRIMARY KEY,
  body text NOT NULL,
  product_id integer NOT NULL REFERENCES products(id)
);

-- Insert data into the `reviews` table
INSERT INTO reviews (product_id, body)
VALUES (1, 'a little small'),
       (1, 'very round!'),
       (2, 'could have been smaller');

-- Display reviews for each product order
SELECT p.name, r.body AS reviews
  FROM products AS p
  JOIN reviews AS r
    ON p.id = r.product_id;

-- Delete tables from database
DROP TABLE orders, products, reviews;
