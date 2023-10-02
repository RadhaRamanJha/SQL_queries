# Aggregate functions query 
-- calculate the maximum and minimum salary by department
select dno department, max(salary) max_salary, min(salary) min_salary from employee group by dno;
-- calculate average standad_deviation and variance by department upto 2 decimal place
SELECT 
    dno department,
    ROUND(AVG(salary), 2) avg_salary,
    ROUND(STDDEV(salary), 2) std_dev_salary,
    ROUND(VARIANCE(salary), 2) var_salary
FROM
    company_db.employee
GROUP BY dno;
-- extract the full name and nick_name(first 2 character of first name and last 2 charachter of last name seperated by '_') of all employees from the table who belong to department having maximum number of employee 
# grouop by queries
# Amazon interview question 
use sakila;
select CURDATE();
select count(0);