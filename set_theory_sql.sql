use sakila;
-- select all customer or actor whose name starts or ends with 'a'
SELECT 
    'cust' type, c.first_name, c.last_name
FROM
    customer c
WHERE
    c.first_name REGEXP '^a'
        OR c.last_name REGEXP 'a$' 
UNION ALL SELECT 
    'atr' type, a.first_name, a.last_name
FROM
    actor a
WHERE
    a.first_name REGEXP '^a'
        OR a.last_name REGEXP 'a$';
-- Even if one record is different 'jennifer davis' 
-- is being repeated for both table 
SELECT 
    'cust' type, c.first_name, c.last_name
FROM
    customer c
WHERE
    c.first_name LIKE 'j%'
        AND c.last_name LIKE 'd%' 
UNION SELECT 
    'actr' type, a.first_name, a.last_name
FROM
    actor a
WHERE
    a.first_name LIKE 'j%'
        AND a.last_name LIKE 'd%';
-- Removing the artificially generated column 
-- will deal with problem
-- "operators are not always the solution use your brain"
SELECT 
    c.first_name, c.last_name
FROM
    customer c
WHERE
    c.first_name LIKE 'j%'
        AND c.last_name LIKE 'd%' 
UNION SELECT 
    a.first_name, a.last_name
FROM
    actor a
WHERE
    a.first_name LIKE 'j%'
        AND a.last_name LIKE 'd%';