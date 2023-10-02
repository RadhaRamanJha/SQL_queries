use sakila;
show tables;
desc customer;
desc address;
desc city;
desc country;
-- Select Country having more than 25 customers and count of customers in it
SELECT 
    con.country, COUNT(c.customer_id) "Number of Customers"
FROM
    customer c
        INNER JOIN
    address a ON c.address_id = a.address_id
        INNER JOIN
    city ct ON a.city_id = ct.city_id
        INNER JOIN
    country con ON ct.country_id = con.country_id
GROUP BY country
having COUNT(c.customer_id) > 25
order by COUNT(c.customer_id) desc;