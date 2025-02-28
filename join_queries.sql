-- Setup for SQL script by starting with a fresh database --
\i ./join_data.sql;

-- Joined tables whether owner ID exists or not
SELECT owners.id, owners.first_name, owners.last_name, vehicles.id, vehicles.make, vehicles.model, vehicles.year, vehicles.price, vehicles.owner_id FROM vehicles FULL OUTER JOIN owners ON owners.id = vehicles.owner_id;

-- Count cars by owner ordered in ascending order
SELECT owners.first_name, owners.last_name, COUNT(owners.id) AS count FROM vehicles INNER JOIN owners ON owners.id = vehicles.owner_id GROUP BY owners.id ORDER BY COUNT(owners.id);

-- Count cars by owner with average price as integers where cars count > 1 & average price > 10000
SELECT owners.first_name, owners.last_name, ROUND(AVG(price)) AS average_price, COUNT(owners.id) AS count FROM vehicles INNER JOIN owners ON owners.id = vehicles.owner_id GROUP BY owners.id HAVING COUNT(owners.id) > 1 AND AVG(price) > 10000 ORDER BY owners.first_name DESC;