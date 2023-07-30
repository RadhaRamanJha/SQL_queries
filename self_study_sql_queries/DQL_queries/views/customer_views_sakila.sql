-- hide the email of customer completly 
use sakila;
desc customer;
SELECT 
    CONCAT('****',
            SUBSTRING(email, LOCATE('@', email), 2),
            '****',
            '.com') hidden_email
FROM
    customer;