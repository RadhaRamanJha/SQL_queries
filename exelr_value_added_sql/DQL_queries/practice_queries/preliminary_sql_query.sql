show databases;  -- shows all the databases available
# use company_db;  -- to use company_db database 
## Shows all the entries from the employee table
-- mothod 1  - without selecting the database
SELECT 
    *
FROM
    company_db.employee;
-- method 2 - after selecting database
use company_db;
SELECT 
    *
FROM
    employee;
## Shows first name and last name from employee table
SELECT 
    fname, lname
FROM
    employee;
## Select details of all female employee from employee table
SELECT 
    *
FROM
    employee
WHERE
    sex = 'F';