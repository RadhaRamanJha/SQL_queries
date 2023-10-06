-- DQL Command (SELECT)
### DQL is for reading purpose only 
show databases;
use excelr_class;
select * from myemp;

select * from myemp limit 10;

select Emp_id,first_name,salary from myemp limit 5;

-- Distinct

SELECT DISTINCT
    (dep_id)
FROM
    myemp;
    
select distinct dep_id,mgr_id from myemp;

## Where clause -- to filter the data

select * from myemp where salary > 10000 and salary < 15000;

select * from myemp order by dep_id;

select * from myemp order by dep_id desc;

select * from myemp order by salary desc;

select * from myemp order by salary desc limit 2;

## Derrived Columns and Alias 
select first_name, last_name,salary,0.1*salary as bonus from myemp;

## Or Logical codition in where sub-clause 

Select * from myemp where dep_id = 80 or dep_id = 90 or dep_id = 30;
-- or 
Select * from myemp where dep_id in (80,90,30);
Select * from myemp where dep_id not in (80,90,30);
select * from myemp;

-- betweeen 
select * from myemp where salary >= 15000 and salary <= 20000 ;
select * from myemp where salary between 15000 and 20000 ;
select * from myemp where salary not between 15000 and 20000 ;

-- Wild Cards :- pattern matching

select * from myemp where first_name like "L%";
select * from myemp where first_name not like "L%";
select * from myemp where first_name like "%A";
select * from myemp where first_name like "N%" and last_name like "%R";

# 04-10-2023
-- Grouping and Aggregate functions
-- 1.count, min, max, average and sum  
select count(*) "Employee number" from myemp;
select min(salary) "Minimum Salary" from myemp;
select max(salary) "Maximum Salary" from myemp;
select avg(salary) "Average Salary" from myemp;
select sum(salary) "Total Salary Expense" from myemp;

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
select * from movies ;
select * from members ;
-- 1. Inner join 
select * from movies mov inner join members mem on  mov.id = mem.movieid;
SELECT 
    mov.title 'Movie Title',
    mov.category,
    CONCAT(mem.first_name, ' ', mem.last_name) member_name
FROM
    movies mov
        INNER JOIN
    members mem ON mov.id = mem.movieid;

-- left Join
select * from movies mov left join members mem on  mov.id = mem.movieid;
SELECT 
    mov.title 'Movie Title',
    mov.category,
    CONCAT(mem.first_name, ' ', mem.last_name) member_name
FROM
    movies mov
        LEFT JOIN
    members mem ON mov.id = mem.movieid;

# natural join
select * from movies natural join members;

-- Right Join
select * from movies mov right join members mem on  mov.id = mem.movieid;
SELECT 
    mov.title 'Movie Title',
    mov.category,
    CONCAT(mem.first_name, ' ', mem.last_name) member_name
FROM
    movies mov
        RIGHT JOIN
    members mem ON mov.id = mem.movieid;
    
-- cross join 
select * from meals;
select * from drinks;
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
-- having subclause used to filter aggregated clause
## Order of Clauses 1. Select 2. From 3.Where - used to filter non aggregated column 4. Group by 5. Having - used to filter aggregated columns 6. Order by 7. Limit 
select dep_id, max(salary) from myemp group by dep_id having max(salary) > 10000 order by dep_id;


