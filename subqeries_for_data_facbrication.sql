use sakila;
SELECT 
    pymnt_groups.name, COUNT(*) num_rentals
FROM
    (SELECT 
        customer_id,
            COUNT(*) num_customers,
            SUM(amount) tot_payments
    FROM
        payment
    GROUP BY customer_id) pyment
        INNER JOIN
    (SELECT 'small fish' name, 0 low_limit, 69.99 upper_limit UNION ALL SELECT 'average hitters' name, 70 low_limit, 99.99 upper_limit UNION ALL SELECT 
        'upper average strikers' name,
            100 low_limit,
            129.99 upper_limit
     UNION ALL SELECT 'grooming lunch' name, 130 low_limit, 159.99 upper_limit UNION ALL SELECT 'shop aholics' name, 160 low_limit, 9999999.99 upper_limit) pymnt_groups ON pyment.tot_payments BETWEEN pymnt_groups.low_limit AND pymnt_groups.upper_limit
GROUP BY pymnt_groups.name