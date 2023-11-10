create database practicedb5;
use practicedb5;
## DDL :- Data Definition Language Commands
-- 1. CREATE
create table students (
sid int,
sname varchar(50),
age int,
course varchar(30)
);
select * from students; 
create table test1(id int);
show tables;

-- 2. DROP
drop table test1;
show tables;

-- 3. Alter
# change 1. Table name 2. Column name 3. Data type of a column 4. Change 
-- 1. Add column 
alter table students add column marks int default 0;
-- 2. Drop column 
alter table students drop column age;
-- 3. Change column name 
alter table students change column sid std_id int;

## To see column data type of each and every colun 
desc students;
-- 4. Change Data type of a column 
alter table students modify column sname varchar(30);

-- 5. Change name of table
alter table students rename to myclass;
select * from myclass;
 alter table myclass rename to students;
 show tables;
 
-- 4. DDL:- Truncate 
select * from students;
truncate students;

# Above command uses below query internally from information_schema 

show create table students;
## DML :- Data Manipulation Language commands
-- 1.  Insert
select * from students;

# Type 1 Insert
insert into students values (8,'Som','MySQL',98);

# Typ2 Insert 
insert into students (std_id,sname,marks) values (5,'Jin',70);

# Type 3 insert 
insert into students values (1,'Tom','MySQL',54), 
                            (2,'Tim','MySQL',60),
                            (3,'Jon','MySQL',43),
                            (4,'Mary',null,null);
select * from students;

-- DML : Update Command
update students
set sname = 'Natasha'
where std_id = 1 ;

# Update command if not works 
set sql_safe_updates = 0 ;

# Changing one column 
update students 
set course = 'MySQL'
where course is null;

# Changing one column 
update students 
set course = 'Dance',
    marks = 68
where std_id = 5;

select * from students;

# Change all column
update students 
set course = 'MySQL';

-- DML: Delete Column
delete from students where std_id = 2; 

delete from students where marks is null;
delete from students ;

select * from students;

insert into students values (1,'Tom','MySQL',54), 
                            (2,'Tim','MySQL',60),
                            (3,'Jon','MySQL',43);

-- DQL : Select command :- Data Query Language

# Select all the records from table
select * from movies;
select * from book_sales;

# Limit keyword
select * from authors limit 5 ;
select * from myemp limit 10;

# limit and offset
-- selects 4th to 6th records of the table  
select * from myemp limit 3 offset 4;

-- selects last 10 records from the table
select * from myemp limit 10 offset 96;

# To display first 3 columns for first 10 records
select EMP_ID, FIRST_NAME, LAST_NAME, SALARY, DEP_ID
from myemp
limit 10;

# Derrived column :- Bonus of 20% to first 10 employees 
select EMP_ID, FIRST_NAME, LAST_NAME, SALARY, (SALARY *0.2) BONUS
from myemp
limit 10;

# Derrived column :- Includes total salary 
select EMP_ID, FIRST_NAME, LAST_NAME, SALARY, (SALARY *0.2) BONUS, (SALARY*1.2) Total_SALARY
from myemp
limit 10;

# To find unique departments from the table
select distinct dep_id from myemp ;

# To find distinct columns from table
select distinct job_id from myemp ;
select distinct fname from person;
select distinct lname from person;

# Select distinct combination
select distinct concat(fname,' ',lname) full_name from person;

# Sorting the output
-- ascending order
select * from myemp order by dep_id limit 10;
select * from myemp order by salary limit 10;

-- descending order
select * from myemp order by dep_id desc limit 10;
select * from myemp order by salary desc limit 10;

-- sort by combination of columns
select * from myemp order by dep_id, hire_date limit 10;

-- sort one column in descending and one in ascending order
select * from myemp order by dep_id desc,mgr_id  limit 10;
select * from myemp order by dep_id, hire_date desc limit 10;

-- select all dpeartment in ascending and descending order
select distinct dep_id from myemp order by dep_id;
select distinct dep_id from myemp order by dep_id desc;

## filter out records based on some condition 
-- employee salary > 10000
select * from myemp where salary > 10000;

-- employee joined before 01/01/2000
select * from myemp where hire_date > '2000-01-01';

-- selecting in a range
select * from myemp where salary between 10000 and 15000;

-- selecting w.r.t specific condition
select * from myemp where year(hire_date) = 1987; # hired in year 1987
select * from myemp where dep_id != 80; # where dep_id is not equal to 80

-- selecting using multiple condition 
# 'and' condition
select * from myemp where dep_id = 80 and salary > 10000;
select * from myemp where dep_id = 80 and mgr_id = 100;
# 'or' condition
select * from myemp where (dep_id = 60) or (dep_id = 70) or (dep_id = 40) ;

# similar output using in condition
select * from myemp where dep_id in (60,70,40) ;

-- Pattern matching
# '%' :- matches any number of charecters inclusing 0 also
-- first character is 'A'  
select * from myemp where first_name like 'A%';
-- last character is 'A'
select * from myemp where first_name like '%A';
-- first name having 'A' anywhere in the name
select * from myemp where first_name like '%A%';
-- employees in sales depatrtement
select * from myemp where job_id like 'SA%' ;
-- selecting all the cleark which are only job_id ending with 'erk'
select * from myemp where job_id like '%erk' ;
# '_' :- matches exactly one character
-- selecting employee of first starting with J and having 5 charater in firat name
select * from myemp where first_name like 'J____';

-- selecting employee of first starting with J and having 4 charater in firat name
select * from myemp where first_name like 'J___';

-- selecting employee having a space in first name
select * from myemp where first_name like '% %';

-- selecting employee having first name not starting with a 
select * from myemp where first_name not like 'a%';
###### Functions ##################
### Row level functions of mysql
# Date add() - function
create table patients(
pid int,
pname varchar(20),
dob date,
toa datetime
);
insert into patients values (1,'Harry','2000-01-26','2007-12-31 23:59:59');
select * from patients;
select adddate(dob, interval 5 day) as result from patients;
select year(dob),month(dob),monthname(dob) from patients;
select hire_date,year(hire_date) from myemp limit 5;
select round(weight) from cats;
## Group level function
use newdb;
select round(avg(weight),2) from cats;
select sum(weight) from cats;
select min(weight) from cats;
select max(weight) from cats;
select std(weight) from cats;
select round(std(weight),2) from cats;
select count(*) from cats;
select distinct(breed) from cats;
select count(distinct(breed)) from cats;
## Group by 
-- breed wise avg weight
select breed, round(avg(weight),1) avg_wt from cats group by breed;
use practicedb5;
select * from myemp limit 5;
-- department wise average
select dep_id, round(avg(salary),2) 
from myemp group by dep_id;
-- department wise manager wise average
select dep_id, mgr_id, avg(salary)
 from myemp 
 group by dep_id,mgr_id;
 
 select dep_id, mgr_id, avg(salary)
 from myemp 
 group by dep_id,mgr_id;

# Joins
use newdb;
select * from movies;
select * from members;
-- inner join
select * from movies inner join members on movies.id = members.movieid;
# by default inner join is considered
select * from movies join members on movies.id = members.movieid;
## Left join
select * from movies left join members on movies.id = members.movieid;
## Right join
select * from movies right join members on movies.id = members.movieid;
select * from authors;
select * from books;
select title,Name 
from authors inner join books 
on books.authorid = authors.authorid;
## Cross join
select * from meals;
select * from drinks;
select m.mealname,d.drinkname,m.rate+d.rate Total_Rate
from meals m cross join drinks d;
#self join 
select emp_id, first_name from myemp limit 10;
select emp.emp_id, emp.first_name Emp_fname,emp.last_name Emp_lname,
mgr.first_name Mgr_fname,mgr.last_name Mgr_lname
from myemp emp join myemp mgr
on emp.mgr_id = mgr.emp_id;
# Data Base Constraints :- Primary keys, Foreign Keys, Sequence Objects
# Types of Constarins - 1 Domain Constarints 2. Key constarints
# 1 Domain Constarints :- Unique, not null, Default, Check
# 2 Key constarints :- Primary key, Secondary key,
show tables;
select * from students;
insert into students values(1,'tom','mysql',21),(1,'tim','mysql',21);
drop table students;
create table students(
              sid integer unique,
              sname varchar(20) not null,
              age integer check(age >18),
              course varchar(20)
);
desc students;
insert into students values(1,'tom',19,'mysql');
insert into students values(2,'tammy',19,'mysql');
select * from students;
insert into students values(null,'jhon',22,'analytics');
insert into students values(null,'jim',19,'mysql');
insert into students values(3,'jhon',17,'analytics');
insert into students values(3,null,18,'analytics');
insert into students (sid,age,course) values(3,19,'analytics');
alter table students modify column sname varchar(20) not null default 'smith';
insert into students (sid,age,course) values(4,25,'mysql');
select * from students;
alter table students modify column sname varchar(20) not null default null;
select * from authors;
select * from books;
drop table authors;
drop table books;
create table authors(authorid integer primary key, name varchar(100));
desc authors;
create table books(
				 bookid integer primary key,
                 title varchar(255),
                 aid integer, foreign key(aid) references authors(authorid)
                 on delete cascade on update cascade);
desc books;
select * from books;
select * from authors;