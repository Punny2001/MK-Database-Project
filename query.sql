-- 
-- Basic Query
--
INSERT INTO membership(mem_id, mem_name, mem_phone, mem_email, mem_date) VALUES
('1200487392849384','Leigh Anthony',	'0847562839','leigh2001@gmail.com',		'2020-12-03 11:25:08'),
('9800485839490265','Annie Lynch',		'0901248294','annielynch@hotmail.com',	'2020-12-03 12:59:23'),
('9800234877198759','Conna Stephenson',	'0946578298','conna1997@gmail.com',		'2020-12-03 16:38:36');

INSERT INTO card_type(type_id, card_name, cash_discount, credit_discount, bdate) VALUES
('U','Leigh Anthony',	'0.05','0.1','2001-05-23'),
('R','Annie Lynch',		'0.05','0.1','1995-11-28'),
('R','Conna Stephenson','0.05','0.1','1997-07-30');

INSERT INTO onsite_card(card_no, exp_date, status_card, activate, deactivate, mem_id, card_name, branch_id) VALUES
('283759201','2021-12-03','T','2020-12-03 11:25:08',null,'1200487392849384','Leigh Anthony',	'1'),
('920934802','2021-12-03','T','2020-12-03 12:59:23',null,'9800485839490265','Annie Lynch',		'2'),
('274823840','2021-12-03','T','2020-12-03 16:38:36',null,'9800234877198759','Conna Stephenson',	'7');

UPDATE onsite_card
SET exp_date='2021-05-14', status_card='T', activate='2020-05-14 12:53:20', deactivate=null
WHERE card_no='023949732';

UPDATE onsite_card
SET exp_date='2021-08-25', status_card='T', activate='2020-08-25 19:42:04', deactivate=null
WHERE card_no='234959032';

-- 
-- BASIC QUERY
--
SELECT * 
FROM membership;

SELECT *
FROM membership
WHERE mem_id LIKE '98%';

SELECT mem_name, mem_phone, mem_email
FROM membership
WHERE mem_phone LIKE '08%';

SELECT bill_no, total_price, cash_name AS cashier, bill_date AS date_time
FROM bill
WHERE bill_no LIKE 'B%';

SELECT bill_no AS bill_number, total_price, mem_id AS member_id
FROM bill
WHERE total_price<1000;

SELECT trans_id AS transfer_id, point_timestamp AS 'timestamp', earning
FROM point_statement
WHERE trans_id LIKE 'R%' 
OR trans_id LIKE 'U%';

SELECT *
FROM point_statement
ORDER BY earning DESC
LIMIT 10;

SELECT username, app_password AS 'password'
FROM online_application
WHERE app_password NOT IN (SELECT app_password FROM online_application WHERE app_password LIKE '0%');

SELECT type_id AS Tyoe, card_name AS 'Name', bdate AS Birthdate
FROM card_type
WHERE cash_discount='0.1' AND credit_discount='0.15'
ORDER BY card_name ASC; 

SELECT type_id AS 'Type', card_name AS 'Name', bdate AS Birthdate
FROM card_type
WHERE bdate BETWEEN '1990-01-01' AND '2000-01-01'
ORDER BY bdate ASC;

SELECT branch_id AS 'Number', branch_location AS Branch
FROM branch
WHERE branch_location NOT IN (SELECT branch_location FROM branch WHERE branch_location LIKE 'Central%');

SELECT card_no, card_name AS 'Name', exp_date AS expiration_date, deactivate
FROM onsite_card
WHERE deactivate IS NOT null;

SELECT card_no, card_name AS 'Name', exp_date AS expiration_date, status_card, branch_id AS Branch
FROM onsite_card
WHERE branch_id BETWEEN 4 AND 5;

SELECT *
FROM onsite_card
WHERE exp_date >= '2021-01-01'
ORDER BY branch_id ASC;

SELECT *
FROM membership
WHERE mem_email LIKE '%hotmail%' AND mem_id LIKE '12%'
ORDER BY mem_name ASC
LIMIT 5;

--
-- Advanced Query --
--

SELECT mem_id AS 'Member ID',cash_name AS 'Cashier Name'
FROM bill
WHERE bill_no = (
				SELECT MIN(bill_no) 
				FROM bill 
				WHERE total_price>1000);
                
SELECT username,point_balance
FROM point_statement p
INNER JOIN online_application o
ON p.mem_id = o.mem_id;

SELECT mem_name AS 'Name', address AS 'Address'
FROM membership m
INNER JOIN online_application o
ON m.mem_id = o.mem_id;

SELECT mem_id, type_id, status_card, deactivate
FROM card_type c
RIGHT OUTER JOIN onsite_card o
ON c.card_name = o.card_name;

SELECT card_name AS 'Name', branch_location AS 'Branch Location', exp_date AS 'EXP Date'
FROM onsite_card o
LEFT OUTER JOIN branch b
ON o.branch_id = b.branch_id;

SELECT card_name, branch_location
FROM onsite_card o
INNER JOIN branch b
ON o.branch_id = b.branch_id
WHERE branch_location LIKE 'Central%';

SELECT mem_name AS 'NAME',total_price AS 'Price'
FROM membership m
INNER JOIN bill b ON m.mem_id = b.mem_id
WHERE total_price = (Select MAX(total_price) FROM bill);

SELECT mem_name, mem_phone, mem_email, status_card
FROM membership m
INNER JOIN onsite_card o ON m.mem_id = o.mem_id
WHERE status_card LIKE 'T' AND m.mem_id LIKE '98%';

SELECT m.mem_id, mem_name, card_no, branch_location 
FROM membership m
INNER JOIN onsite_card o ON m.mem_id = o.mem_id
INNER JOIN branch b ON o.branch_id = b.branch_id
ORDER BY m.mem_id ASC;

SELECT AVG(total_price) AS Average_price
FROM bill
WHERE bill_no LIKE 'A%';

SELECT COUNT(mem_id) AS 'Student Member'
FROM membership
WHERE mem_id LIKE '12%';

SELECT SUM(earning) AS 'Total earning point'
FROM point_statement;

SELECT branch_location, SUM(total_price) AS 'Total price'
FROM branch br
INNER JOIN onsite_card o ON br.branch_id = o.branch_id
INNER JOIN bill b ON o.mem_id = b.mem_id
GROUP BY br.branch_id;

SELECT mem_name AS 'Name', mem_date AS 'Registration date', bill_date AS 'Bill date'
FROM membership m
INNER JOIN bill b
ON m.mem_id = b.mem_id
WHERE b.bill_date >= '2018-12-01 12:00:00';

SELECT o.mem_id, o.card_name, o.card_no, type_id, username, branch_location, point_balance
FROM onsite_card o
INNER JOIN card_type c ON o.card_name = c.card_name
INNER JOIN online_application oa ON o.mem_id = oa.mem_id
INNER JOIN branch b ON o.branch_id = b.branch_id
INNER JOIN point_statement p ON o.mem_id = p.mem_id
WHERE deactivate IS null AND o.mem_id LIKE '98%'
ORDER BY o.card_name ASC
LIMIT 5;




