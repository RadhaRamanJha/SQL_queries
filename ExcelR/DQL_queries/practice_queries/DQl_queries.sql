-- DQL Command (SELECT)
### DQL is for reading purpose only 
show databases;
use excelr_class;
select * from myemp;

# This limit subclause limits the output of query to 10 entries
select * from myemp limit 10;

# This limit subclause limits the output of query to 5 entries
select Emp_id,first_name,salary from myemp limit 5;

-- Distinct :- To select Distinct value per selection 

SELECT DISTINCT
    (dep_id)
FROM
    myemp;
    
select distinct dep_id,mgr_id from myemp;

## Where clause -- to filter the data

select * from myemp where salary > 10000 and salary < 15000;

-- Order by :- To sort our result based on a any particular column
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

-- Grouping and Aggregate functions