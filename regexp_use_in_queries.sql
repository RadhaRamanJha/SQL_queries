use sakila;
show tables;
-- query all cities which name starts with vowel
SELECT 
    city
FROM
    city
WHERE
    city REGEXP '^[aeiou]';
-- query all cities which name ends with vowel
SELECT 
    city
FROM
    city
WHERE
    city REGEXP '[aeiou]$';
-- query all cities which name doesnot starts with vowel
SELECT 
    city
FROM
    city
WHERE
    city REGEXP '^[^aeiou]';
-- query all cities which name doesnot ends with vowel
SELECT 
    city
FROM
    city
WHERE
    city REGEXP '[^aeiou]$';
-- query all cities which name starts and ends with vowel
SELECT 
    city
FROM
    city
WHERE
    city REGEXP '^[aeiou].*[aeiou]$';
-- query all cities which name neither starts nor ends with vowel
SELECT 
    city
FROM
    city
WHERE
    city REGEXP '^[^aeiou].*[^aeiou]$';
-- query all cities which name that starts but not ends with vowel
SELECT 
    city
FROM
    city
WHERE
    city REGEXP '^[aeiou].*[^aeiou]$';
-- query all cities which name that doesnot starts but ends with vowel
SELECT 
    city
FROM
    city
WHERE
    city REGEXP '^[^aeiou].*[aeiou]$';