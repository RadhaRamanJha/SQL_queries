# date functions 
# H.W -- check cast() function
-- year() 
-- month()
-- day()
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