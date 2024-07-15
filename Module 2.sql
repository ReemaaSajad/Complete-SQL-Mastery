SELECT 
	name,
    unit_price AS 'unit price',
    unit_price * 1.1 AS new_price 
from products;

SELECT * 
FROM customers
WHERE state = 'VA';

SELECT * 
FROM orders
WHERE order_date > '2018-12-31';

SELECT * 
FROM order_items
WHERE (order_id = 6 AND unit_price * quantity > 30);

SELECT * 
FROM products 
WHERE quantity_in_stock IN (49,38,72);

SELECT *
FROM customers 
WHERE birth_date BETWEEN '1990-01-01'AND '2000-01-01';

SELECT *
FROM customers 
WHERE address LIKE '%trail%' OR address LIKE '%avenue%';
SELECT *
FROM customers
WHERE phone NOT LIKE '%9';

SELECT * 
FROM customers
WHERE first_name REGEXP 'ELKA|AMBUR';
SELECT * FROM customers WHERE last_name REGEXP 'ey$|on$';
SELECT * FROM customers WHERE last_name REGEXP '^my|se';
SELECT * FROM customers WHERE last_name REGEXP 'b[ru]';

SELECT * 
FROM orders
WHERE shipped_date IS NULL;

SELECT *, quantity* unit_price AS total_price
FROM order_items 
WHERE order_id = 2 
ORDER BY total_price DESC;

SELECT * 
FROM customers
ORDER BY points DESC
LIMIT 3;