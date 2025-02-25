-- Setup for SQL script by starting with a fresh database --
\i ./seed_products.sql;

-- 1. Insert a product with chair, 44, and can be returned false
INSERT INTO products (name, price, can_be_returned) VALUES ('chair', 44.00, false);

-- 2. Insert a product with stool, 25.99, and can be returned true
INSERT INTO products (name, price, can_be_returned) VALUES ('stool', 25.99, true);

-- 3. Insert a product with table, 124.00, and can be returned false
INSERT INTO products (name, price, can_be_returned) VALUES ('table', 124.00, false);

-- 4. Display all rows and columns in the table
SELECT * from products;