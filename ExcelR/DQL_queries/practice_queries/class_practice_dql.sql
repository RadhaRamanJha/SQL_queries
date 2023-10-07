use excelr_class;
SELECT 
    *
FROM
    myemp;

# Fetch all the info where job_id = "IT_PROG"
SELECT 
    *
FROM
    myemp
WHERE
    job_id = 'IT_PROG';

# Fetch all info where Hire_Date > year 2000
# *** hire_date > 200
SELECT 
    *
FROM
    myemp
WHERE
    YEAR(hire_date) > 2000;
## Below Query returns 11 rows
SELECT 
    *
FROM
    myemp
WHERE
    hire_date > 20000101;
## Below Query returns 9 rows
SELECT 
    *
FROM
    myemp
WHERE
    hire_date > 20001231;
## Without using min function the least salary 
SELECT 
    first_name, last_name, salary
FROM
    myemp
ORDER BY salary ASC
LIMIT 1;
## Without using max function the maximum salary
SELECT 
    first_name, last_name, salary
FROM
    myemp
ORDER BY salary DESC
LIMIT 1;