-- DQL Command (SELECT)
### DQL is for reading purpose only 
show databases;
use excelr_class;
-- Show all the columns of myemp table
SELECT 
    *
FROM
    myemp;

-- Use of "limit" subclause to limit the number of rows of result
SELECT 
    *
FROM
    myemp
LIMIT 10;

SELECT 
    Emp_id, first_name, salary
FROM
    myemp
LIMIT 5;

-- Use of "Distinct" subclause to select Distinct values 

SELECT DISTINCT
    (dep_id)
FROM
    myemp;
    
SELECT DISTINCT
    dep_id, mgr_id
FROM
    myemp;

-- Use where
SELECT 
    *
FROM
    myemp
WHERE
    salary > 10000 AND salary < 15000;

SELECT 
    *
FROM
    myemp
ORDER BY dep_id;

SELECT 
    *
FROM
    myemp
ORDER BY dep_id DESC;

SELECT 
    *
FROM
    myemp
ORDER BY salary DESC;

SELECT 
    *
FROM
    myemp
ORDER BY salary DESC
LIMIT 2;

SELECT 
    first_name, last_name, salary, 0.1 * salary AS bonus
FROM
    myemp;

SELECT 
    *
FROM
    myemp
WHERE
    dep_id = 80 OR dep_id = 90
        OR dep_id = 30;
-- or 
SELECT 
    *
FROM
    myemp
WHERE
    dep_id IN (80 , 90, 30);
SELECT 
    *
FROM
    myemp
WHERE
    dep_id NOT IN (80 , 90, 30);
SELECT 
    *
FROM
    myemp;

-- betweeen 
SELECT 
    *
FROM
    myemp
WHERE
    salary >= 15000 AND salary <= 20000;
SELECT 
    *
FROM
    myemp
WHERE
    salary BETWEEN 15000 AND 20000;
SELECT 
    *
FROM
    myemp
WHERE
    salary NOT BETWEEN 15000 AND 20000;

-- Wild Cards :- pattern matching

SELECT 
    *
FROM
    myemp
WHERE
    first_name LIKE 'L%';
SELECT 
    *
FROM
    myemp
WHERE
    first_name NOT LIKE 'L%';
SELECT 
    *
FROM
    myemp
WHERE
    first_name LIKE '%A';
SELECT 
    *
FROM
    myemp
WHERE
    first_name LIKE 'N%'
        AND last_name LIKE '%R';

SELECT 
    COUNT(*) 'Employee number'
FROM
    myemp;
SELECT 
    MIN(salary) 'Minimum Salary'
FROM
    myemp;
SELECT 
    MAX(salary) 'Maximum Salary'
FROM
    myemp;
SELECT 
    AVG(salary) 'Average Salary'
FROM
    myemp;
SELECT 
    SUM(salary) 'Total Salary Expense'
FROM
    myemp;

-- Group with aggregate 
SELECT 
    dep_id,
    COUNT(*) 'Employee number',
    MIN(salary) 'Minimum Salary',
    MAX(salary) 'Maximum Salary',
    AVG(salary) 'Average Salary',
    SUM(salary) 'Total Salary Expense'
FROM
    myemp
GROUP BY dep_id
ORDER BY dep_id;

-- Joins 
SELECT 
    *
FROM
    movies;
SELECT 
    *
FROM
    members;
-- 1. Inner join 
SELECT 
    *
FROM
    movies mov
        INNER JOIN
    members mem ON mov.id = mem.movieid;
SELECT 
    mov.title 'Movie Title',
    mov.category,
    CONCAT(mem.first_name, ' ', mem.last_name) member_name
FROM
    movies mov
        INNER JOIN
    members mem ON mov.id = mem.movieid;

-- left Join
SELECT 
    *
FROM
    movies mov
        LEFT JOIN
    members mem ON mov.id = mem.movieid;
SELECT 
    mov.title 'Movie Title',
    mov.category,
    CONCAT(mem.first_name, ' ', mem.last_name) member_name
FROM
    movies mov
        LEFT JOIN
    members mem ON mov.id = mem.movieid;

SELECT 
    *
FROM
    movies
        NATURAL JOIN
    members;

-- Right Join
SELECT 
    *
FROM
    movies mov
        RIGHT JOIN
    members mem ON mov.id = mem.movieid;
SELECT 
    mov.title 'Movie Title',
    mov.category,
    CONCAT(mem.first_name, ' ', mem.last_name) member_name
FROM
    movies mov
        RIGHT JOIN
    members mem ON mov.id = mem.movieid;
    
-- cross join 
SELECT 
    *
FROM
    meals;
SELECT 
    *
FROM
    drinks;
SELECT 
    *
FROM
    meals
        CROSS JOIN
    drinks;

-- constraints :- set of conditions
/* 
1. Primary Key :- Unique, not null
2. Foreign Key :- It is Primary key in some other table
3. Check constraint
4. NOT Null 
5. Default
6. Unique
*/
SELECT 
    dep_id, MAX(salary)
FROM
    myemp
GROUP BY dep_id
HAVING MAX(salary) > 10000
ORDER BY dep_id;
use excelr;
show tables;
use exelr;
select * from students_d;
-- Null Value
## Create a Sample Table
use exelr;
CREATE TABLE employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    age INT,
    department VARCHAR(50)
);
## Insert Values into it
INSERT INTO employees (first_name, last_name, age, department)
VALUES
    ('John', 'Doe', 30, 'HR'),
    ('Jane', 'Smith', NULL, 'IT'),
    ('Bob', 'Johnson', 35, 'Sales'),
    ('Alice', 'Brown', NULL, 'Marketing');
desc employees;
select * from employees;
# Use is in place of '=' in where clause for 
select * from employees where age is Null;
select * from employees where age is not null;
use excelr_class;
select * from myemp order by salary desc;

-- offset subclause is upper cap to skip values
select * from myemp order by salary desc limit 3 offset 4;

-- Case-When :- Should be inside select statement 
/*
Keywords for Case When 
1. Case
2. When and Then
3. Else
4. END
*/
select * from myemp order by salary desc;
SELECT 
    first_name, salary,
    CASE
        WHEN salary < 5000 THEN 0.2*salary
        WHEN salary < 15000 THEN 0.15*salary
        ELSE 0.10*salary
    END Bonus
FROM
    myemp
ORDER BY salary DESC;
create view view1 as (SELECT 
    first_name, salary,
    CASE
        WHEN salary < 5000 THEN 0.2*salary
        WHEN salary < 15000 THEN 0.15*salary
        ELSE 0.10*salary
    END Bonus
FROM
    myemp
ORDER BY salary DESC);
select * from view1;
-- View from table 
## Simple View
-- view 1 
create view emp1 as
 select * from myemp limit 10;
 
-- View 2
 CREATE VIEW dep_50 AS
    SELECT 
        *
    FROM
        myemp
    WHERE
        dep_id = 50;
## Queries on the Views
select * from emp1;
select * from dep_50;

## Complex Views
CREATE VIEW auth_book AS
    SELECT 
        name, title
    FROM
        authors
            INNER JOIN
        books ON authors.AuthorId = books.AuthorID;
-- Query on the View
SELECT 
    *
FROM
    auth_book;
-- Window Functions -- 1. Row Number 2. Rank 3. DenseRank 4. Lag 5. Lead
# 1. Rank
select *,rank() over(partition by dep_id order by salary) as rnk from myemp;

# 2. Dense Rank
select *,dense_rank() over(partition by dep_id order by salary) as dense_rnk from myemp;

-- Dense Rank and Row number 
select *,dense_rank() over(partition by dep_id order by salary) as dense_rnk,row_number() over(partition by dep_id order by salary) row_num from myemp;

# 3. Row number
select *,row_number() over(partition by dep_id order by salary) as rnk from myemp;

-- Lag and Lead 
select * from trains;
# 1. Lag
select *, lag(time) over(partition by(Station) order by time) previous_train from trains;
# 2. Lead 
select *, lead(time) over(partition by(Station) order by time) next_train from trains;

# Indexes
show index from myemp;
create table students(
s_id int primary key not null auto_increment,
s_name varchar(50) not null,
phone_number char(10)
);
create unique index idx on students(s_name,phone_number);
insert into students values(null,'Tum','8972944676'),(null,'Ton','8972944675');
insert into students values('Tim','8972944676'),('Tom','8972944675');
select * from students;
desc students;

	