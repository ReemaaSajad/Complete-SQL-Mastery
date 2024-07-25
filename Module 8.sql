-- Views are like virtual tables which provide a short cut instead of having to write extensive 
-- SELECT statements each time you wan tto access data
CREATE VIEW clients_balance AS 
SELECT 
	client_id,
    name,
    SUM(invoice_total - payment_total) AS balance
FROM clients c
JOIN invoices i USING (client_id)
GROUP BY client_id, name;

-- If you want to drop view, you can use the command DROP VIEW view_name
-- If you want to modify an already existign view, then you can use the 
-- command CREATE OR REPLACE VIEW view_name .....

-- A view is called an updatable view if it does not have the folowing 
-- DISTINCT, AGGREGATE functions (SUM, COUNT, MIN, MAX), GROUP BY/ 
-- HAVING, UNION. This means that you can use the view in insert,
-- update and delete statements.  

 