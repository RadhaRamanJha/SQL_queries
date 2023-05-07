SELECT CONCAT(c.firstName, c.lastName) NAME,ca.full_address
FROM customer c INNER join customer_address ca on c.customer_id = ca.customer_id
order by c.customer_id;
