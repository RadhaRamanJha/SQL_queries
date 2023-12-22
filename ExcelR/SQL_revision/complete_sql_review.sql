show databases;
-- Syntax for Database Creation
create database Practicedb6;
use Practicedb6;
show tables;
create table students(
			          sid int,
                      sname char(30),
                      age int,
                      course char(20)
                      );

insert into students values(1,'Tom',27,'MySQL');
insert into students values(2,'Mary',28,'Python');
insert into students values(4,'Jon',29,'Pandas'),(5,'Harry',29,'Numpy');
insert into students(sid,age,sname,course) values(6,35,'Jonny','DA+DS');
insert into students(sid,course,age,sname)values(7,'PowerBI',34,'Tina'),(8,'Tableau',36,'Radha'),(9,'Excel',36,'Vina'),(8,'DA+DS+AI',37,'RR Jha');
select * from students;
-- DDl
## 1. create commonad 
create table students_dup(
			          sid int,
                      sname char(30),
                      age int,
                      course char(20)
                      );
## 2. Alter commands along with it's subclause
# add columns subclause
alter table students 
add column marks int;

# drop column subclause
alter table students 
drop column age;

# modify subclause to change data type
alter table students
modify column sname varchar(30);

# modify subclause to column name
alter table students
change column sid std_id int;

# modify subclause to name table
alter table students 
rename to My_students;
desc My_students;

# Adding a column at a specific position
alter table My_students
add column age int after sname;

## 3. Drop
create table sample (sname char);
desc sample;
drop table sample;

## 4. Rename -- can also be used as main command
rename table my_students to students;
select * from students;

## DML coommands 
## 1. Insert 
insert into students_dup values(1,'Tom',27,'MySQL');
insert into students_dup(sid,age,course) values(6,35,'DA+DS');
insert into students_dup(sid,course,age,sname)values(7,'PowerBI',34,'Tina'),(8,'Tableau',36,'Radha'),(9,'Excel',36,'Vina'),(8,'DA+DS+AI',37,'RR Jha');
select * from students_dup;

## 2. Update 
update students_dup set sname = 'Akash' where sid = 6;
update students_dup set course = 'MySQL';
update students_dup set marks = 85 where sname = "Tom" and course = "MySQL";
update students set age = 18;
update students set marks = 50 where std_id < 5;
select * from students;
update students set marks = 70 where marks is null;

## 3. Delete
