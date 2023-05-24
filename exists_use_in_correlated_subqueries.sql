use sakila;
-- Customers who rented movie on 25-05-2005
SELECT 
    c.first_name, c.last_name
FROM
    customer c
WHERE
    EXISTS( SELECT 
            *    -- there is no significance of these lines
        FROM
            rental r
        WHERE
            c.customer_id = r.customer_id
                AND DATE(r.rental_date) = '2005-05-25');
-- Customers who rented movie prior 25-05-2005
SELECT 
    c.first_name, c.last_name
FROM
    customer c
WHERE
    EXISTS( SELECT 
            2,3   -- as long as they have any meanigful name
        FROM
            rental r
        WHERE
            c.customer_id = r.customer_id
                AND DATE(r.rental_date) < '2005-05-25');
-- Customers who rented movie after 25-05-2005
SELECT 
    c.first_name, c.last_name
FROM
    customer c
WHERE
    EXISTS( SELECT 
            @@activate_all_roles_on_login    -- anthing which strikes fantacy can be used 
        FROM
            rental r
        WHERE
            c.customer_id = r.customer_id
                AND DATE(r.rental_date) > '2005-05-25');