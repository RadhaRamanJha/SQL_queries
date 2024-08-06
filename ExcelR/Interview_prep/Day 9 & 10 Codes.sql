/*Views*/

select * from myemp;

select first_name,last_name,dep_id,salary from myemp;

create view emp_detail as (
select first_name,last_name,dep_id,salary from myemp);

select * from emp_detail;

select * from movies;

select * from members;

select Title,Category,ifnull(first_name,"-") as First_name,
ifnull(last_name,"-") as Last_name from movies as mo
left join
members as mm
on mo.id=mm.movieid;

create view mov_detail as(
select Title,Category,ifnull(first_name,"-") as First_name,
ifnull(last_name,"-") as Last_name from movies as mo
left join
members as mm
on mo.id=mm.movieid
);

select * from mov_detail;

show tables;

show full tables where table_type="VIEW";

/*Access restriction for users using view*/

select * from myemp where dep_id=80;

create view dep80 as (select * from myemp where dep_id=80);

select * from dep80;

Select * from authors;

describe authors;

select * from authors where authorid<=5;

create view aut_view as (select * from authors where authorid<=5);

select * from aut_view;

insert into aut_view values(16,"Amita"); /*violation but no error. it will affect the table*/

select * from authors;

/*To overcome this violation - use check option during view creation*/

drop view aut_view;

create view aut_view as (select * from authors where authorid<=5) with check option;

insert into aut_view values(17,"chetan");

/*Stored Prodecure*/
/*Two types of execution of stored procedure*/

/*
variable_procedure;
var_change_procedure;
simple_parameter;
no_parameter;
in_parameter;
out_parameter;
inout_parameter;
new_procedure_if;
new_procedure_elseif;
simpleloop_procedure;
simpleloop_counter;
simpleloop_parameter;
new_procedure_repeat;
new_procedure_while;
error_handling;
cursor_order_status;
*/

/*Parameters*/

call anadb.variable_procedure();

/*Types of Parameters*/

/* 1.)In Parameter is used when we want to pass a value to a procedure
2.) Out Parameter is used when we want to return a value from the procedure
3.) InOut Parameter is used when we want to set an initial value,
update the value and then return the value from the procedure */

create table author (author_id integer primary key, 
                            authorName varchar(30), 
                            email varchar (25), gender varchar (6));

create table book (BookId integer not null unique, 
                        ISBN integer primary key, 
                       book_name varchar (30) not null, 
                        author integer, ed_num integer, 
                      price integer, pages integer, 
         foreign key (author) references author (author_id) on delete cascade);
         
         select * from book;
         select * from author;
         
insert into author values 
              (1, "Kraig Muller", "Wordnewton@gmail.com", "Male");
insert into author values
              (2, "Karrie Nicolette", "karrie23@gmail.com", "Female");
insert into book values
              (1, 001, "Glimpses of the past", 1, 1, 650, 396);
insert into book values
              (2, 002, "Beyond The Horizons of Venus", 1, 1, 650, 396);
insert into book values
              (3, 003, "Ultrasonic Aquaculture", 2, 1, 799, 500);
insert into book values
              (4, 004, "Cryogenic Engines", 2, 1, 499, 330); 

/*Conditional Statements*/

/*1.If Statement*/

/*2.Else If Statement*/

/*Loop Statements

 3 Types
 
 Simple loop
 Repeat Until
 Do while */
 
 /*Error Handling or Exceptions Handling*/
 
 /*https://dev.mysql.com/doc/mysql-errors/8.0/en/server-error-reference.html*/

use anadb;

truncate table payments;
select * from payments;

describe fraud;

truncate table fraud;
select * from fraud;

describe fraud;

insert into payments values (1,1000);

insert into payments values (5,null);

/* 3 stages of handling error

error code level - lowest
SQL State level - middle
sql exceptions level - Highest */

/*2 types of handlers Continue & Exit*/

/*instead of "continue" if you give "exit" then it wil exit the code. It will not execute the code below to the error code*/
/*Instead of declaring any SQL state we can directly give sqlexception*/
/*Also we can declare the error code directly after handler for*/