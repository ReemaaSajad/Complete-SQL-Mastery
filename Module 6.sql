SELECT * 
FROM store.products
WHERE unit_price >
(SELECT unit_price FROM store.products
WHERE product_id = 3);

use sql_hr;
SELECT *
FROM employees 
WHERE salary >
(SELECT AVG(salary)
FROM employees );

use invoicing;
SELECT * 
FROM clients 
WHERE client_id
NOT IN (SELECT DISTINCT client_id 
FROM invoices);

use store;
SELECT customer_id, first_name, last_name
FROM customers 
WHERE customer_id IN
(
SELECT customer_id 
FROM orders 
WHERE order_id IN (
SELECT order_id
FROM order_items 
WHERE product_id = (SELECT product_id
FROM products
WHERE name LIKE '%Lettuce%')
)
);

SELECT customer_id, first_name, last_name
FROM customers 
WHERE customer_id IN (
SELECT o.customer_id
FROM order_items oi
JOIN orders o USING (order_id)
WHERE product_id = 3
);

SELECT DISTINCT c.customer_id, c.first_name, c.last_name
FROM customers c
JOIN orders o USING (customer_id)
JOIN order_items oi USING (order_id)
WHERE oi.product_id = (
SELECT product_id FROM products WHERE name LIKE '%Lettuce%')
ORDER BY customer_id;

use invoicing;
SELECT * FROM invoices 
WHERE invoice_total > ALL
(SELECT invoice_total FROM invoicing.invoices
WHERE client_id = 3
);

-- Similar to ALL , we also have ANY and SOME keyword. ALL checks
--  if the value is greater than all the values in the list before it is returned. 
-- = ANY is equivalent to the IN operator. 


-- Correlated subquery example 
SELECT * 
FROM employees e 
WHERE salary > (
SELECT AVG(salary)
FROM employees 
WHERE office_id = e.office_id
);


use invoicing;
SELECT * 
FROM invoices i
WHERE invoice_total >
(
SELECT AVG(invoice_total)
FROM invoices
WHERE i.client_id = client_id
);

-- Using the exists operator
-- Performing the same tasks using IN and EXISTS
SELECT * FROM clients
WHERE clients_id IN (
	SELECT DISTINCT client_id
    FROM invoices
);
-- As opposed to In which returns a list of elements EXISTS only 
-- returns true/false which is the ideal condition when the list
-- elements in long 
SELECT * FROM clients c
WHERE EXISTS (
	SELECT client_id
    FROM invoices 
    WHERE client_id = c.client_id
);

SELECT *
FROM products p
WHERE NOT EXISTS
(SELECT product_id
FROM order_items 
WHERE p.product_id = product_id);

-- Subqueries are not limited to where clauses, we can also use them 
-- in the SELECT clause and FROM clause 
-- Inorder to be able to reuse this subquery in another column, we 
-- cannot directly use the alias and hence we put the select statement 
-- withing parenthesis and then the alias to be able to use it 
SELECT 
	invoice_id, 
	invoice_total,
    (SELECT AVG(invoice_total)
		FROM invoices) AS invoice_average,
	invoice_total - (SELECT invoice_average) AS difference
FROM invoices;
	
SELECT * FROM invoicing.invoices;
use invoicing;
SELECT client_id, 
		name,
        (SELECT SUM(invoice_total) FROM invoices WHERE c.client_id = client_id) AS total_sales,
        (SELECT AVG(invoice_total) FROM invoices ) AS average,
        (SELECT total_sales - average) AS difference
FROM clients c;


    







