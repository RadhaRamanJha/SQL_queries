use sakila;
show tables;
desc customer;
desc store;
desc address;
select * from address;
-- join with older syntax
SELECT 
    c.first_name, c.last_name, a.address
FROM
    customer c,
    address a
WHERE
    c.address_id = a.address_id
        AND a.district = 'Texas';
-- query customer fname laname email district city country from country whose name starts and ends with (a or b)
SELECT 
    c.first_name,
    c.last_name,
    c.email,
    a.district,
    ct.city,
    con.country
FROM
    customer AS c
        INNER JOIN
    address AS a ON c.address_id = a.address_id
        INNER JOIN
    city AS ct ON ct.city_id = a.city_id
        INNER JOIN
    country AS con ON ct.country_id = con.country_id
WHERE
    con.country REGEXP '^[ab].*[ab]$';
-- customer first_name, customer last_name, address, city and country
SELECT 
    c.first_name,
    c.last_name,
    addr.address,
    addr.city,
    addr.country
FROM
    customer c
        INNER JOIN
    (SELECT 
        address.address_id address_id,
            address.address address,
            city.city city,
            country.country country
    FROM
        address
    INNER JOIN city ON address.city_id = city.city_id
    INNER JOIN country ON country.country_id = city.country_id) addr ON c.address_id = addr.address_id; 