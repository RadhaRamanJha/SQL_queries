SELECT 
    c.first_name, c.last_name
FROM
    customer c
WHERE
    20 = (SELECT 
            COUNT(*)
        FROM
            rental r
        WHERE
            r.customer_id = c.customer_id)