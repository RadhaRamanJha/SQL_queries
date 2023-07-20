use sakila;
-- creating view
CREATE VIEW cus_view (customer_id , first_name , last_name , email_id) AS
    SELECT 
        customer_id,
        first_name,
        last_name,
        CONCAT(SUBSTRING(email, 1, 2),
                '****',
                SUBSTRING(email, - 4)) email_id
    FROM
        customer;
-- sleecting first 10 rwos and column from view
### Syntax
-- SUBSTRING(string, start, length)
-- Parameter Values
-- Parameter	Description
-- string	Required. The string to extract from
-- start	Required. The start position. The first position in string is 1
-- length	Required. The number of characters to extract. Must be a positive number
SELECT 
    *
FROM
    cus_view
LIMIT 10;
-- select 2 rows from table_view
SELECT 
    first_name, email_id
FROM
    cus_view
LIMIT 10;
## group query agianst cus_view 
-- 1 
SELECT 
    first_name, COUNT(*), MAX(first_name), MIN(last_name)
FROM
    cus_view
GROUP BY 1
HAVING COUNT(*) > 1
ORDER BY 1;

-- 2 
SELECT 
    first_name, COUNT(*), MAX(first_name), MAX(last_name)
FROM
    cus_view
GROUP BY 1
HAVING COUNT(*) > 1
ORDER BY 1;
-- using inner join on view and payment table
SELECT 
    cv.first_name, cv.last_name, p.amount
FROM
    cus_view cv
        INNER JOIN
    payment p ON cv.customer_id = p.customer_id
WHERE
    p.amount >= 11;
desc address;
-- distric wise customer view
drop view dist_w_cust;
create view dist_w_cust(full_name, hidden_address, distict)
as
(select concat(c.first_name," ",c.last_name) full_name, concat("***", substring(a.address,-5)) hidden_address, a.district district
from customer c inner join  address a on c.address_id = a.address_id );
-- query to know the customer district wise
select full_name, distict from dist_w_cust;
