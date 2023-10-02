## Filtering operators 
################## not condition '
-- get employee details whose department not in 4
-- way 1 
SELECT 
    *
FROM
    employee
WHERE
    dno != 4;
-- way 2
SELECT 
    *
FROM
    employee
WHERE
    NOT dno = 4;
-- way 2 
-- further filteration of this data based on gender
SELECT 
    *
FROM
    employee
WHERE
    dno != 4 AND NOT sex = 'M';
##################### Between clause 
-- get fname and salary of employee getting a salary between 20k and 30k 
SELECT 
    fname, salary, dno, sex
FROM
    employee
WHERE
    salary BETWEEN 20000 AND 30000;
-- further filteration of above result based on department 
SELECT 
    fname, salary, dno, sex
FROM
    employee
WHERE
    (salary BETWEEN 20000 AND 30000)
        AND (dno = 4);
-- further filteration of above result based on gender
SELECT 
    fname, salary, dno, sex
FROM
    employee
WHERE
    (salary BETWEEN 20000 AND 30000)
        AND (dno = 4)
        AND (sex = 'F');
-- get details of employee where pno = 10 and working bwteen 10 to 30 hrs 
desc works_on;
SELECT 
    *
FROM
    works_on
WHERE
    (pno = 10) AND (hours BETWEEN 10 AND 30);
### bonus query get the above details along with their name
desc employee;
SELECT 
    e.fname emp_name,
    e.sex gender,
    e.salary emp_salary,
    w.pno project_number,
    w.hours working_hours
FROM
    works_on w
        INNER JOIN
    employee e ON e.ssn = w.essn
WHERE
    (hours BETWEEN 10 AND 30) AND (pno = 10);