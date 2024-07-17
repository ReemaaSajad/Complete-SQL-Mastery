
INSERT INTO products 
VALUES (DEFAULT, 'Cheerios', 25, 1.33),
(DEFAULT, 'Tater Tots', 20, 18.8),
(DEFAULT, 'Shawarma', 22, 22.2);

INSERT INTO products (name, quantity_in_stock, unit_price) 
VALUES ('Product 1', 10, 20); 

INSERT INTO orders (customer_id, order_id, status)
VALUES (1, '2019-10-10', 1);

INSERT INTO order_items
VALUES 
	(LAST_INSERT_ID(),1,1,2.95),
    (LAST_INSERT_ID(),2,1,3.95);

CREATE TABLE orders_archived AS
SELECT * FROM orders;

INSERT INTO invoices_archived 
SELECT * FROM invoices;

USE sql_invoicing;
CREATE TABLE invoices_archived AS
SELECT i.invoice_id, i.number, c.name as client, i.invoice_total, i.payment_total, i.due_date, i.payment_date
FROM invoices i
JOIN clients c 
ON i.client_id = c.client_id
WHERE i.payment_date IS NOT NULL;

UPDATE invoices 
SET 
	payment_total = 1000, payment_date = due_date
WHERE invoice_id = 3;



