-- Stored procedures
DELIMITER $$
CREATE PROCEDURE get_invoices_with_balance()
BEGIN
	SELECT * 
    FROM invoices 
    WHERE (invoice_total - payment_total > 0);
END$$
DELIMITER ;

-- To drop procedure
DROP PROCEDURE IF EXISTS get_payments;
-- The if exists is there so that SQL does not throw error in 
-- case the procedure does not actually exist

DELIMITER $$
CREATE PROCEDURE get_payments 
(
	client_id INT,
    payment_method_id TINYINT
)
BEGIN
	SELECT * 
    FROM payments p
    WHERE p.client_id  = IFNULL(client_id, p.client_id) AND 
			p.payment_method = IFNULL(payment_method_id, p.payment_method);
END$$

DELIMITER ;

CALL get_payments(NULL, 2);

-- Procedured can also be used to update and delete data in addition to selecting data from tables