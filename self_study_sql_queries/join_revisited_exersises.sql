use sakila;
show tables;
desc payment;
desc customer;
-- 10.1 a query that returns each customer name along with their total payments using above table definitions 
SELECT 
    CONCAT(c.first_name, ' ', c.last_name) full_name,
    SUM(p.amount) total_payment
FROM
    customer c
        LEFT OUTER JOIN
    payment p ON c.customer_id = p.customer_id
GROUP BY full_name
ORDER BY full_name;
-- 10.2 Obtaining the same result with right outer join
SELECT 
    CONCAT(c.first_name, ' ', c.last_name) full_name,
    SUM(p.amount) total_payment
FROM
    payment p
        RIGHT OUTER JOIN
    customer c ON c.customer_id = p.customer_id
GROUP BY full_name
ORDER BY full_name;
-- 10.3 a query that will generate the set {1, 2, 3, ..., 99, 100}. 
SELECT 
    (ones.num + tens.num + 1) number
FROM
    (SELECT 0 num UNION ALL SELECT 1 num UNION ALL SELECT 2 num UNION ALL SELECT 3 num UNION ALL SELECT 4 num UNION ALL SELECT 5 num UNION ALL SELECT 6 num UNION ALL SELECT 7 num UNION ALL SELECT 8 num UNION ALL SELECT 9 num) ones
        CROSS JOIN
    (SELECT 0 num UNION ALL SELECT 10 num UNION ALL SELECT 20 num UNION ALL SELECT 30 num UNION ALL SELECT 40 num UNION ALL SELECT 50 num UNION ALL SELECT 60 num UNION ALL SELECT 70 num UNION ALL SELECT 80 num UNION ALL SELECT 90 num) tens
ORDER BY number;