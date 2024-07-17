-- SUM, AVERAGE, MIN, MAX, COUNT are there 

SELECT 
'First half of 2019' AS date_range,
SUM(invoice_total) AS total_sales,
SUM(payment_total) AS total_payments,
SUM(invoice_total-payment_total) AS what_we_expect
FROM invoices WHERE invoice_date BETWEEN '2019-01-01' AND '2019-06-30'
UNION
SELECT 
'Second half of 2019' AS date_range,
SUM(invoice_total) AS total_sales,
SUM(payment_total) AS total_payments,
SUM(invoice_total - payment_total) AS what_we_expect
FROM invoices
WHERE invoice_date BETWEEN '2019-07-01' AND '2019-12-31'
UNION
SELECT 
'Total' AS date_range,
SUM(invoice_total) AS total_sales,
SUM(payment_total) AS total_payments,
SUM(invoice_total - payment_total) AS what_we_expect
WHERE invoice_date BETWEEN '2019-01-01' AND '2019-12-31';

-- Keep this order in mind for using the various clauses
--  - FROM, WHERE, GROUP BY and ORDER BY
SELECT 
	client_id, 
    SUM(invoice_total) AS total_sales
FROM invoices
WHERE invoice_date >= '2019-07-01'
GROUP BY client_id
ORDER BY total_sales DESC;

use sql_invoicing;
SELECT 
date,
pm.name AS payment_method,
SUM(p.amount) AS total_payments
FROM payments p
JOIN  payment_methods pm 
ON p.payment_method = pm.payment_method_id
GROUP BY date, pm.name
ORDER BY date;

SELECT 
quantity*unit_price as spending
FROM customers c
JOIN orders o USING (customer_id)
JOIN order_items oi USING (order_id);

-- HAVING is used to filter data after GROUP BY. It solves the case where 
-- we can't use WHERE to filter the data since WHERE clause comes before the 
-- GROUP BY clause. With WHERE clause, you can filter data before the rows are grouped and 
-- with the HAVING clause, you can filter data after the rows are grouped.  However, the 
-- columns used in HAVE clause have to be a part of SELECT clause.
use store;
SELECT 
c.customer_id,
c.first_name,
c.last_name,
SUM(oi.quantity*oi.unit_price) AS total_spending
FROM customers c
JOIN orders o USING (customer_id)
JOIN order_items oi USING (order_id)
WHERE state = 'VA'
GROUP BY c.customer_id, c.first_name, c.last_name
HAVING total_spending > 100; 

-- ROLL UP is used to neatly summarize the result of GROUP BY
use sql_invoicing;
SELECT 
	pm.name,
	SUM(amount) AS total
FROM payments p 
JOIN payment_methods pm 
ON p.payment_method = pm.payment_method_id
GROUP BY pm.name WITH ROLLUP



