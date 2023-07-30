# in and not in
use company_db;
# employees works in departement no in 4 and 5
SELECT 
    *
FROM
    employee
WHERE
    dno IN (4 , 5); 
# employees works in departement other than 3 and 4
SELECT 
    *
FROM
    employee
WHERE
    dno NOT IN (3 , 4);
# is null 
# get details of employees where super_ssn is null
SELECT 
    *
FROM
    employee
WHERE
    super_ssn IS NULL; 
# get ssn of employees whose working hours is null
SELECT 
    ssn emp_id, fname emp_name
FROM
    employee
WHERE
    super_ssn IS NULL;
# is not null
SELECT 
    ssn emp_id, fname emp_name
FROM
    employee
WHERE
    super_ssn IS NOT NULL;
# order by 
# display name and salary of employee sorted in ascending order 
SELECT 
    fname emp_name, salary
FROM
    employee
ORDER BY salary;
# display name and salary of employee sorted in descending order
SELECT 
    fname emp_name, salary
FROM
    employee
ORDER BY salary DESC;
# limit -- used whenever there is mention of top 3 or bottom 3
# get top 3 female employee based on salary
SELECT 
    fname emp_name, salary
FROM
    employee
WHERE
    sex = 'F'
ORDER BY salary DESC
LIMIT 3;
# get info of only employee getting 2nd highest salary (limit syntax - limit skip_rows,keep_rows )
SELECT 
    *
FROM
    employee
ORDER BY salary DESC
LIMIT 1 , 1;
# Aggregation founction :- 
-- sum
SELECT 
    SUM(salary) tot_dept_exp
FROM
    employee;
-- min
# get details of female employee getting minimum salary
-- max min salary that female employees are getting
SELECT 
    MIN(salary)
FROM
    employee
WHERE
    sex = 'F';
-- count the number of female enployee in employee table
SELECT 
    COUNT(fname) num_female
FROM
    employee
WHERE
    sex = 'f';
-- count the number of male employee in employee table
SELECT 
    COUNT(fname) num_male
FROM
    employee
WHERE
    sex = 'm';
-- average
-- calaulate the average male and female salaries;
SELECT 
    sex gender, COUNT(fname) emp_num, AVG(salary) average_pay
FROM
    employee
GROUP BY gender;

# get number of employee in department 5 
# check if super_ssn Id is duplicated 
# min and max working hours in work_on table for project no 2 
# # sum() 
# sum of all salary given to all female and male employee 
# average salary 
# Check the average of all females and males in all departments
# calculate standarad deviation of salary for all department # round it to 1,2 places