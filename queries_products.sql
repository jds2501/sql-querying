-- Setup for SQL script by starting with a fresh database --
\i ./seed_products.sql;

-- 1. Insert a product with chair, 44, and can be returned false
INSERT INTO products (name, price, can_be_returned) VALUES ('chair', 44.00, false);

-- 2. Insert a product with stool, 25.99, and can be returned true
INSERT INTO products (name, price, can_be_returned) VALUES ('stool', 25.99, true);

-- 3. Insert a product with table, 124.00, and can be returned false
INSERT INTO products (name, price, can_be_returned) VALUES ('table', 124.00, false);

-- 4. Display all rows and columns in the table
SELECT * FROM products;

-- 5. Display product names only
SELECT name FROM products;

-- 6. Display product name and price
SELECT name, price FROM products;

-- 7. Add a product of my choice
INSERT INTO products (name, price, can_be_returned) VALUES ('Nintendo Switch', 250.00, true);

-- 8. Display products that can be returned
SELECT * FROM products where can_be_returned = true;

-- 9. Display price < 44
SELECT * FROM products WHERE price < 44.00;

-- 10. Price between 22.50 & 99.99
SELECT * FROM products WHERE price BETWEEN 22.50 AND 99.99;

-- 11. Sale - 20 dollars off, update
UPDATE products SET price = price - 20.0;

-- 12. < 25 dollars is sold out
DELETE FROM products WHERE price < 25;

-- 13. Increase remaining products by 20 dollars
UPDATE products SET price = price + 20.0;

-- 14. Everything is returnable
UPDATE products Set can_be_returned = true;