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
    '2005-02-01' < rental_date < '2005-11-01'
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
-- when i add this where clause the num_rental for feburary becomes 0 eventhogh first range start from 01 january 
WHERE
    rental_date BETWEEN '2005-01-01' AND '2005-12-01';