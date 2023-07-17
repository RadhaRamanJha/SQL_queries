use sakila;
SELECT 
    a.first_name, a.last_name
FROM
    actor a
WHERE
    a.first_name LIKE 'J%'
        AND a.last_name LIKE 'D%' 
UNION ALL SELECT 
    a.first_name, a.last_name
FROM
    actor a
WHERE
    a.first_name LIKE 'M%'
        AND a.last_name LIKE 'T%' 
UNION SELECT 
    c.first_name, c.last_name
FROM
    customer c
WHERE
    c.first_name LIKE 'J%'
        AND c.last_name LIKE 'D%';
-- changing the order of operators
SELECT 
    a.first_name, a.last_name
FROM
    actor a
WHERE
    a.first_name LIKE 'J%'
        AND a.last_name LIKE 'D%' 
UNION SELECT 
    a.first_name, a.last_name
FROM
    actor a
WHERE
    a.first_name LIKE 'M%'
        AND a.last_name LIKE 'T%' 
UNION ALL SELECT 
    c.first_name, c.last_name
FROM
    customer c
WHERE
    c.first_name LIKE 'J%'
        AND c.last_name LIKE 'D%';
-- Trying to dictate the order of query by using parenthesis
SELECT 
    a.first_name, a.last_name
FROM
    actor a
WHERE
    a.first_name LIKE 'J%'
        AND a.last_name LIKE 'D%'
union all
(SELECT 
    a.first_name, a.last_name
FROM
    actor a
WHERE
    a.first_name LIKE 'M%'
        AND a.last_name LIKE 'T%' 
UNION SELECT 
    c.first_name, c.last_name
FROM
    customer c
WHERE
    c.first_name LIKE 'J%'
        AND c.last_name LIKE 'D%');