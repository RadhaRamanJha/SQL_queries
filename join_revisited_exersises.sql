-- Join revisited exersises 
-- 10.1 -- using left outer join to obtain customer name and total payment
use sakila;
show tables;
SELECT 
    CONCAT(c.first_name, ' ', c.last_name) full_name,
    SUM(p.amount) tot_payments
FROM
    customer c
        LEFT OUTER JOIN
    payment p ON c.customer_id = p.customer_id
GROUP BY full_name; 
-- 10.2 -- using right outer join to obtain same results
SELECT 
    CONCAT(c.first_name, ' ', c.last_name) full_name,
    SUM(p.amount) tot_payments
FROM
        payment p
        RIGHT OUTER JOIN
        customer c
        
    ON c.customer_id = p.customer_id
GROUP BY c.customer_id;
-- 10.3 --  a query that will generate the set {1, 2, 3, ..., 99, 100}.
SELECT 
    (ones.x + tens.x) numbers
FROM
    ((SELECT 0 x UNION ALL SELECT 1 x UNION ALL SELECT 2 x UNION ALL SELECT 3 x UNION ALL SELECT 4 x UNION ALL SELECT 5 x UNION ALL SELECT 6 x UNION ALL SELECT 7 x UNION ALL SELECT 8 x UNION ALL SELECT 9 x) ones
    CROSS JOIN (SELECT 0 x UNION ALL SELECT 10 x UNION ALL SELECT 20 x UNION ALL SELECT 30 x UNION ALL SELECT 40 x UNION ALL SELECT 50 x UNION ALL SELECT 60 x UNION ALL SELECT 70 x UNION ALL SELECT 80 x UNION ALL SELECT 90 x) tens)
ORDER BY numbers;