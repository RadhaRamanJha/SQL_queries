# date functions 
# H.W -- check cast() function
-- year() 
-- month()
-- day()
use company_db;
SELECT 
    bdate,
    YEAR(bdate) year_bdate,
    MONTH(bdate) month_bdate,
    DAY(bdate) day_bdate
FROM
    company_db.employee;
 use company_db;
# counting the number of employee whose bday in month january
SELECT 
    COUNT(ssn) num_jan_employye
FROM
    employee
WHERE
    MONTH(bdate) = 1;
# get department wise total salary
SELECT 
    dno dept_no, SUM(salary) total
FROM
    employee
GROUP BY dno
ORDER BY total DESC;
-- get average of salary gender wise
SELECT 
    sex gender, AVG(salary) avg_salaary, COUNT(ssn) num_emp
FROM
    employee
GROUP BY sex;
-- select total working hours per each project for employee with id '333445555'
SELECT 
    essn, pno, SUM(hours)
FROM
    works_on
WHERE
    essn = '333445555'
GROUP BY pno;
select * from works_on;
# get total hours and number of projects each person is working on 
SELECT 
    essn, COUNT(pno) num_proj, SUM(hours) tot_hrs
FROM
    works_on
GROUP BY essn
ORDER BY num_proj DESC;
#### Multiple group by
# get total salary of employee per gender per department 
SELECT 
    dno dept, sex gender, SUM(salary) tot_salary, COUNT(*) num
FROM
    employee
GROUP BY dno , sex;

########################## V.V.I #############################################################
# Having clause applied on aggregated values created by groupby clause
# because " where " clause is applied only data present in the existing table of data base 
# if we have to filter ot data based on having clause --
# we have to place it before group by
########################## V.V.I #############################################################
-- Display the Dno of those departments that has 4 employees
select dno dept_no, count(ssn) num_emp
from employee
group by dno
having num_emp = 4;

-- 
select dno dept_no, count(ssn) num_emp, max(salary) as max_salary
from employee
where sex = "F"
group by dno
having  max_salary > 20000
order by max_salary desc;

# get list of employees whose total working hr is atleast 35 hrs
desc works_on;
select essn, sum(hours) tot_wrkng_hrs
from works_on
group by essn
having tot_wrkng_hrs >= 35 
order by tot_wrkng_hrs desc;