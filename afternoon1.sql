-- person

CREATE TABLE person(
    person_id SERIAL PRIMARY KEY,
    name VARCHAR(64),
    age INTEGER,
    height FLOAT,
    city VARCHAR(64),
    favorite_color VARCHAR(64)
);

INSERT INTO person(name, age, height, city, favorite_color) VALUES
('Bobby', 13, 100.5, 'Tennessee', 'red'),
('Bret', 47, 156.4, 'Seaconch', 'grey'),
('Vinny', 57, 136.0, 'New York', 'purple'),
('Rally', 25, 147.0, 'Dover', 'green'),
('May', 22, 155.0, 'Cape Canaveral', 'orange');

SELECT * FROM person ORDER BY height DESC;
SELECT * FROM person ORDER BY height ASC;
SELECT * FROM person ORDER BY age DESC;
SELECT * FROM person WHERE age > 20;
SELECT * FROM person WHERE age = 18;
SELECT * FROM person WHERE age < 20 OR age > 30;
SELECT * FROM person WHERE age != 27;
SELECT * FROM person WHERE favorite_color != 'red';
SELECT * FROM person WHERE favorite_color != 'red' AND favorite_color != 'blue';
SELECT * FROM person WHERE favorite_color = 'orange' OR favorite_color = 'green';
SELECT * FROM person WHERE favorite_color IN ('orange', 'green', 'blue');
SELECT * FROM person WHERE favorite_color in ('yellow', 'purple');

-- orders (relies on person table)
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    person_id INTEGER,
    product_name VARCHAR(64),
    product_price FLOAT,
    quantity INTEGER
);

INSERT INTO orders (person_id, product_name, product_price, quantity) values
(1, 'pizza', 2.99, 4),
(2, 'sushi', 5.99, 1);

SELECT * FROM orders;
SELECT SUM(quantity) FROM orders;
SELECT SUM(product_price * quantity) FROM orders;
SELECT SUM(product_price * quantity) FROM orders WHERE person_id = 1;

-- artist

INSERT INTO artist (artist_id, name) VALUES
(276, 'Ray'),
(277, 'Zerona');

SELECT * FROM artist ORDER BY name DESC LIMIT 10;
SELECT * FROM artist ORDER BY name ASC LIMIT 5;
SELECT * FROM artist WHERE name LIKE 'Black%';
SELECT * FROM artist WHERE name LIKE '%Black%';

-- employee
SELECT * FROM employee ORDER BY birth_date DESC LIMIT 1;
SELECT * FROM employee ORDER BY birth_date ASC LIMIT 1;
SELECT * FROM employee WHERE reports_to = 2;
SELECT COUNT(*) FROM employee WHERE city = 'Lethbridge';

-- invoice
SELECT COUNT(*) FROM invoice WHERE billing_country = 'USA';
SELECT MAX(total) FROM invoice;
SELECT MIN(total) FROM invoice;
SELECT * FROM invoice WHERE total > 5;
SELECT COUNT(*) FROM invoice WHERE total < 5;
SELECT COUNT(*) FROM invoice WHERE billing_state IN ('CA', 'TX', 'AZ');
SELECT AVG(total) FROM invoice;
SELECT SUM(total) FROM invoice;