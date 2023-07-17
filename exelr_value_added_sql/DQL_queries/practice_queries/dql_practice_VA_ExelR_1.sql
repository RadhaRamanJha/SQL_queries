use company_db;
# select details from all employess 
SELECT 
    *
FROM
    company_db.employee;
# get all details from department tables
SELECT 
    *
FROM
    company_db.department;
-- select fname and salary in employee
SELECT 
    fname, salary
FROM
    company_db.employee;
-- select department name and number from department table
SELECT 
    dname, dnumber
FROM
    company_db.department;
-- select unique department number from employee 
SELECT DISTINCT
    dno
FROM
    company_db.employee;
SELECT 
    *
FROM
    dependent;
-- select distinct relation ship from dependent
SELECT DISTINCT
    relationship
FROM
    dependent;

-- select all details from works_on if pno = 2 and working hours > 7 
SELECT 
    *
FROM
    company_db.works_on
WHERE
    pno = 2 AND hours > 7;
    
-- Get details about all employee from dept no. 4 or 5
SELECT 
    *
FROM
    employee
WHERE
    dno = 4 OR dno = 5;