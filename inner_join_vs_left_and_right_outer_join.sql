use sakila;
-- inner join 
SELECT 
    CONCAT(c.first_name, c.last_name) NAME, a.address
FROM
    customer c
        INNER JOIN
    address a ON c.address_id = a.address_id
ORDER BY c.customer_id;

-- left outer join
SELECT 
    CONCAT(c.first_name, c.last_name) NAME, a.address
FROM
    customer c
        LEFT OUTER JOIN
    address a ON c.address_id = a.address_id
ORDER BY c.customer_id;

-- right outer join 
SELECT 
    CONCAT(c.first_name, c.last_name) NAME, a.address
FROM
    customer c
        right OUTER JOIN
    address a ON c.address_id = a.address_id
ORDER BY c.customer_id;

-- the inner join and left outer join yeilds same result but right outer join yeilds different result
select count(*) from customer;
select count(*) from address;
-- address table has 4 extra addresses with no customer name which are simply ignored in inner join and let outer join 
-- but not in case of right outer join