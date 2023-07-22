use company_db;
-- Q1)
# get number of dependents per each employee

SELECT 
    essn, COUNT(*) num_dependent
FROM
    dependent
GROUP BY essn;

-- Q2)
# get number of dependents based on year of bdate for dependent like || o/p date | num of employee per year ||

SELECT 
    YEAR(bdate) dob_year, COUNT(*) num_dependent
FROM
    dependent
GROUP BY dob_year;

-- Q3)
# get total working hours per project of employee whose project number between 10 to 30

SELECT 
    pno project_num, SUM(hours) tot_wrking_hrs
FROM
    works_on
WHERE
    pno BETWEEN 10 AND 30
GROUP BY pno;

-- Q4)
# get average salary of employees based on department number
SELECT 
    dno dept_num, round(avg(salary),2) avg_salary
FROM
    employee
where salary is not null  
  
# even though not applicale for the selected database 
# this statement is important because presence of a null value will affect the average

GROUP BY dept_num;

-- Q5) 
#  get average salary of employees based on year of bdate
SELECT 
    YEAR(bdate) dob_year, ROUND(AVG(salary), 2) avg_salary
FROM
    employee
GROUP BY dob_year
ORDER BY dob_year;
select * from employee;

-- Q6) 
# get average salary of employees based on on department number and year of bdate
SELECT 
    dno dept_num,
    YEAR(bdate) dob_year,
    ROUND(AVG(salary), 2) avg_salary
FROM
    employee
GROUP BY dept_num , dob_year;

