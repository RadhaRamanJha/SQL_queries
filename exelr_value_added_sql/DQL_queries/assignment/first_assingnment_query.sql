#1.Get employees whose birth year is between 1940 to 1960
-- brute force method
use company_db;
SELECT 
    fname, bdate
FROM
    employee
WHERE
    ('1940-01-01' <= bdate
        AND bdate <= '1960-12-31');
-- Without selecting the database AND using year() function
SELECT 
    fname, bdate
FROM
    company_db.employee
WHERE
    YEAR(bdate) BETWEEN 1940 AND 1960;

# 2. Details of all female employees whose salary betweeen 15k and 30k
-- brute force method 
SELECT 
    *
FROM
    employee
WHERE
    (sex = 'f') AND (15000 <= salary)
        AND (salary <= 30000);
-- using between and not operator
SELECT 
    *
FROM
    employee
WHERE
    sex <> 'M'
        AND salary BETWEEN 15000 AND 30000;
# 3. Get project name which has pattern "ctx" or "cty"
-- brute force method 
SELECT 
    pname
FROM
    project
WHERE
    (pname LIKE '%ctx%')
        OR (pname LIKE '%cty%');
-- using regular expression
SELECT 
    pname
FROM
    project
WHERE
    pname REGEXP '.*ct[xy].*';