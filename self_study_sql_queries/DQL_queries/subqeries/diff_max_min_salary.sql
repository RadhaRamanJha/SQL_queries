use company_db;
-- minimum salary and number of employees getting minimum salary
SELECT 
    MIN(salary),
    (SELECT 
            COUNT(*)
        FROM
            employee
        WHERE
            salary = (SELECT 
                    MIN(salary)
                FROM
                    employee))
FROM
    employee;
-- (maximum salary * number of employee getting maximum salary) - (minimum salary * number of employee getting minimum salary)
SELECT 
    ABS((MAX(salary) * (SELECT 
                    COUNT(*)
                FROM
                    employee
                WHERE
                    salary = (SELECT 
                            MAX(salary)
                        FROM
                            employee))) - (MIN(salary) * (SELECT 
                    COUNT(*)
                FROM
                    employee
                WHERE
                    salary = (SELECT 
                            MIN(salary)
                        FROM
                            employee)))) salary_diff
FROM
    employee; 