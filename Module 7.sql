-- ROUND, CEILING, FLOOR AND CEILING AND ABS 
-- are some common numerical functions. RAND generates a 
-- random floating point number from 0 to 1

-- There are similar string functions such as LENGTH.
-- UPPER and LOWER. There are 3 functions for removing 
-- unnecessary spaces in a string. These are LTRIM (for
-- left trim), RTRIM (for right trim) and TRIM. Other 
-- string functions are LEFT, RIGHT, SUBSTRING, 
-- LOCATE and CONCAT.

-- There are several date based functions. NOW() returns the 
-- current date and time, CURDATE() returns current date and
-- CURTIME() returns current time only  
SELECT NOW();
SELECT YEAR(NOW());
SELECT MONTH(NOW());
SELECT MINUTE(NOW());
SELECT SECOND(NOW());
-- Similarly, dayname(now()) and monthname(now()) return day
-- and month as strings
-- Similarly, EXTRACT is a universal SQL function unlike the 
-- above mentioned ones which are specific to mySQL
SELECT EXTRACT(YEAR FROM NOW()); 

UPDATE orders 
SET order_date = '2024-08-09' 
WHERE order_id = 1 AND customer_id = 6;

USE store;
SELECT * 
FROM orders 
WHERE order_date >= CONCAT(EXTRACT(YEAR FROM NOW()),'-01-01-');
-- Similar query for same output
SELECT * FROM orders WHERE YEAR(order_date) = YEAR(NOW());

--  DATEFORMAT() function can be used to format date and time into a 
-- user-friendly format from the SQL standard 'YEAR-MONTH-DATE' format

-- DATE_ADD and DATE_SUB are functions that are used to add and subtract years 
-- from a given date. DATEDIFF is used to calculate the difference between two 
-- given dates. TIME_TO_SEC() gives the number of seconds elapsed since mifdnight

-- IFNULL function can be used to substitute a null value with some other value in
-- in a returned query.
SELECT order_id, IFNULL(shipper_id, 'Not Assigned') AS Shipper FROM orders;
SELECT order_id, COALESCE(shipper_id,comments, 'Not Assigned') AS Shipper FROM orders;

SELECT 
	CONCAT(first_name,' ', last_name) AS customer,
    IFNULL(phone, 'Unknown') AS phone
FROM customers;


-- IF function returns a value depending on if the condition is true or not
-- IF(expression, first, second)

SELECT product_id,
name, 
COUNT(*) AS orders,
IF(COUNT(*)>1, 'Many times', 'Once') AS frequency
FROM 
products p 
JOIN order_items USING (product_id)
GROUP BY product_id, name;

-- CASE operator
SELECT 
	CONCAT(first_name, ' ', last_name) AS Customer,
    points,
    CASE 
		WHEN points > 3000 THEN 'Gold'
        WHEN points BETWEEN 2000 AND 3000 THEN 'Silver'
        WHEN points < 2000 THEN 'Bronze'
		END AS Category
	FROM customers;




 
