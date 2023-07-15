use sakila;
show tables;
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

-- using subquery to return an entry based on condition logic
desc customer;
desc rental;
desc inventory;
SELECT 
    first_name,
    last_name,
    CASE
        WHEN active = 0 THEN 0
        ELSE (SELECT 
                COUNT(*)
            FROM
                rental r
            WHERE
                r.customer_id = c.customer_id)
    END num_rental
FROM
    customer c; 
    
-- classification of all movies in groups of suitable age veiwer based on category without using else clause using searched case expression
SELECT 
    title,
    category,
    CASE
        WHEN category IN ('family' , 'comedy', 'animation', 'children') THEN 'all age'
        WHEN
            category IN ('documentary' , 'sports',
                'music',
                'sci-fi',
                'drama',
                'classics',
                'new',
                'games',
                'travel')
        THEN
            '13+'
        WHEN category IN ('horror' , 'foreign', 'action') THEN 'Adult'
    END 'Suitable for'
FROM
    film_list;
-- -- classification of all movies in groups of suitable age veiwer based on category with using else clause using simple case expression
SELECT 
    title,
    category,
    CASE category
        WHEN 'horror' THEN 'Adult'
        WHEN 'foreign' THEN 'Adult'
        WHEN 'action' THEN 'Adult'
        WHEN 'family' THEN 'All Age'
        WHEN 'comedy' THEN 'All Age'
        WHEN 'animation' THEN 'All Age'
        WHEN 'children' THEN 'All Age'
        ELSE '13+'
    END 'Suitable for'
FROM
    film_list;
-- Result set trnsformation using conditional logic
desc rental;
select * from rental; 
SELECT 
    MONTHNAME(rental_date) month_name, COUNT(*) tot_rentals
FROM
    rental
WHERE
    '2005-02-01' < rental_date AND rental_date < '2005-11-01'
GROUP BY MONTHNAME(rental_date)
ORDER BY tot_rentals;
-- Transforming the above result set so that only one row is returned 
SELECT 
    SUM(CASE
        WHEN MONTHNAME(rental_date) = 'february' THEN 1
        ELSE 0
    END) feb_rentals,
    SUM(CASE
        WHEN MONTHNAME(rental_date) = 'may' THEN 1
        ELSE 0
    END) may_rentals,
    SUM(CASE
        WHEN MONTHNAME(rental_date) = 'june' THEN 1
        ELSE 0
    END) june_rentals,
    SUM(CASE
        WHEN MONTHNAME(rental_date) = 'august' THEN 1
        ELSE 0
    END) august_rentals,
    SUM(CASE
        WHEN MONTHNAME(rental_date) = 'july' THEN 1
        ELSE 0
    END) july_rentals
FROM
    rental
WHERE
    rental_date BETWEEN '2005-01-01' AND '2005-12-01';
    
-- using conditional logic to check the ratings of films in which actors have appeared
SELECT 
    CONCAT(a.first_name, ' ', a.last_name) full_name,
    CASE
        WHEN
            EXISTS( SELECT 
                    1
                FROM
                    film_actor fa
                        INNER JOIN
                    film f ON fa.film_id = f.film_id
                WHERE
                    ((fa.actor_id = a.actor_id)
                        AND f.rating = 'G'))
        THEN
            'Y'
        ELSE 'N'
    END 'G_rating_appearence',
    CASE
        WHEN
            EXISTS( SELECT 
                    1
                FROM
                    film_actor fa
                        INNER JOIN
                    film f ON fa.film_id = f.film_id
                WHERE
                    ((fa.actor_id = a.actor_id)
                        AND f.rating = 'PG'))
        THEN
            'Y'
        ELSE 'N'
    END 'PG_rating_appearence',
    CASE
        WHEN
            EXISTS( SELECT 
                    1
                FROM
                    film_actor fa
                        INNER JOIN
                    film f ON fa.film_id = f.film_id
                WHERE
                    ((fa.actor_id = a.actor_id)
                        AND f.rating = 'PG-13'))
        THEN
            'Y'
        ELSE 'N'
    END 'PG-13_rating_appearence',
    CASE
        WHEN
            EXISTS( SELECT 
                    1
                FROM
                    film_actor fa
                        INNER JOIN
                    film f ON fa.film_id = f.film_id
                WHERE
                    ((fa.actor_id = a.actor_id)
                        AND f.rating = 'R'))
        THEN
            'Y'
        ELSE 'N'
    END 'R_rating_appearence',
    CASE
        WHEN
            EXISTS( SELECT 
                    1
                FROM
                    film_actor fa
                        INNER JOIN
                    film f ON fa.film_id = f.film_id
                WHERE
                    ((fa.actor_id = a.actor_id)
                        AND f.rating = 'NC-17'))
        THEN
            'Y'
        ELSE 'N'
    END 'NC-17_rating_appearence'
FROM
    actor a;
    
-- Avoiding division by 0 error by using conditional logic
SELECT 
    c.first_name,
    c.last_name,
    SUM(p.amount) tot_pay,
    COUNT(p.amount) num_pay,
    SUM(p.amount) / CASE
        WHEN COUNT(p.amount) = 0 THEN 1
        ELSE COUNT(p.amount)
    END avg_pay
FROM
    customer c
        LEFT OUTER JOIN
    payment p ON c.customer_id = p.customer_id
GROUP BY c.first_name , c.last_name;
-- counting the film categories
SELECT 
    SUM(CASE
        WHEN rating = 'G' THEN 1
        ELSE 0
    END) 'G',
    SUM(CASE
        WHEN rating = 'PG' THEN 1
        ELSE 0
    END) 'PG',
    SUM(CASE
        WHEN rating = 'PG-13' THEN 1
        ELSE 0
    END) 'PG-13',
    SUM(CASE
        WHEN rating = 'R' THEN 1
        ELSE 0
    END) 'R',
    SUM(CASE
        WHEN rating = 'NC-17' THEN 1
        ELSE 0
    END) 'NC-17'
FROM
    film;