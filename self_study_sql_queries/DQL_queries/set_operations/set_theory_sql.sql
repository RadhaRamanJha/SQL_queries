use sakila;
-- select all customer or actor whose name starts or ends with 'a'
/* SELECT 
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
-- To remove the duplicate columns we simply have to remove the altificial column and  use union
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
        AND a.last_name LIKE 'd%';/*
-- use of intersect operator
select c.first_name, c.last_name 
from customer c
where first_name like 'j%'
 and 
 last_name like 'd%'
intersect
select a.first_name, a.last_name 
from actor a;

-- use of except operator 
select (c.first_name) 
from customer c 
except 
select (a.first_name) 
from actor a;