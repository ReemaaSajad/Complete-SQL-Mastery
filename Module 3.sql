SELECT order_id,p.product_id, quantity, o.unit_price
FROM order_items o
JOIN products p
ON o.product_id = p.product_id;

USE sql_invoicing;
SELECT p.date, p.invoice_id, p.amount, c.name, pm.name
FROM payments p
JOIN clients c ON p.client_id = c.client_id
JOIN payment_methods pm ON p.payment_method = pm.payment_method_id;

SELECT p.product_id, p.name, oi.quantity
FROM products p
LEFT JOIN order_items oi 
ON p.product_id = oi.product_id;


SELECT o.order_date, o.order_id, c.first_name AS customer, s.name AS shipper, os.name AS status
FROM orders o
LEFT JOIN customers c 
ON o.customer_id = c.customer_id
LEFT JOIN shippers s
ON o.shipper_id = s.shipper_id
JOIN order_statuses os
ON o.status = os.order_status_id
ORDER BY order_date;

use sql_invoicing;
SELECT p.date, c.name AS client, p.amount, pm.name
FROM payments p 
JOIN payment_methods pm
ON p.payment_method = pm.payment_method_id
JOIN clients c 
USING (client_id);

use store;
SELECT s.name, p.name 
FROM shippers s 
CROSS JOIN products p;

use store;
SELECT s.name AS shipper, p.name AS product
FROM shippers s, products p
ORDER BY shipper;

SELECT 
	customer_id, 
    first_name, 
    points, 
    'Bronze' AS type
FROM customers
WHERE points <= 2000
UNION
SELECT 
	customer_id, 
    first_name, 
    points, 
    'Silver' AS type
FROM customers
WHERE points BETWEEN 2000 AND 3000
UNION
SELECT 
	customer_id, 
    first_name, 
    points, 
    'Gold' AS type
FROM customers
WHERE points >3000
ORDER BY first_name;

