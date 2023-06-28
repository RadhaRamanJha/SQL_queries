use sakila;
-- conditional logic returning strings
desc customer;
-- conditional logic examples
SELECT 
    first_name,
    last_name,
    CASE
        WHEN active = 1 THEN 'Active'
        ELSE 'Inactive'
    END Activity
FROM
    customer
ORDER BY Activity;
-- using conditional logic 
desc customer;
desc rental;
desc inventory;
select first_name , last_name, case 
when active = 0 then 0
else (select count(*) from rental r where r.customer_id = c.customer_id) end num_rental
