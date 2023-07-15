use sakila;
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
select * from dependent;
select distinct relationship from dependent;
select * from employee;
select fname name, lname title from employee;
select * from employee where salary >= 30000;
SELECT 
    *
FROM
    employee
WHERE
    sex = 'M' AND dno = 4;
#   
select * from works_on;
SELECT 
    *
FROM
    works_on
WHERE
    pno = 10 AND hours > 7;
    
# 
SELECT 
    *
FROM
    employee
WHERE
    dno = 4 OR dno = 5;