use anadb;

select * from products;

describe products;

select pcode,pvendor,qtyinstock from products;

/*If the quantity is low then automatically record should be inserted into orders table*/

truncate table orders;
select * from orders;

describe orders;

/*Cursors - Always holds the output of the select query

3 Steps

1. Declare the cursor
2. Open the cursor
3. Read the records from select
4. In order to read the records we are gonna give loop and fetch statments*/

select orderid,product_code,vendor,status,qtyinstock as Quantity from orders as ord
left join
products as prd
on ord.product_code=prd.pcode
and ord.vendor=prd.pvendor
order by qtyinstock;

/*User defined Functions*/

select * from myemp;

select emp_id,first_name,last_name,hire_date,experience(emp_id) as Anything
from myemp;

describe myemp;

select emp_id,first_name,last_name,year(current_date)-year(hire_date) as "Experience" from myemp;

SET GLOBAL log_bin_trust_function_creators = 1;

/*Triggers*/

/*drops sales column if already exist*/

alter table books drop column sales;

select * from books;

desc books;

select * from book_sales;

describe book_sales;

alter table books add column sales int default 0;

update books set sales=sales+5 where bookid=2;

/*check and run the update multiple times for same and different bookid*/

truncate book_sales;

/*Sub Query*/

select * from myemp where salary=(select max(salary) from myemp);

select * from myemp where salary=24000;

select max(salary) from myemp;

/*I want to find out the employees who is getting salary less than lisa*/

select * from myemp where salary < lisa Salary;

select salary from myemp where first_name="lisa";

select * from myemp where salary<
(select salary from myemp where first_name="lisa");

select * from myemp where salary<11500;

/*I want to list out all the employees who salary is greater than the average salary*/

select * from myemp where salary>(select avg(salary) from myemp) order by salary;

select * from myemp where salary>6456.60 order by salary;

/*Case Statements*/

select distinct dep_id from myemp;

select emp_id,FIrst_name,last_name,dep_id,
case 
when dep_id=110 then "Accounts"
when dep_id=100 then "Finance"
when dep_id=90 then "Management"
when dep_id=80 then "Sales"
when dep_id=70 then "Public Relations"
when dep_id=60 then "Information Technology"
when dep_id=40 then "Human Resource"
when dep_id=20 then "Marketing"
else "Others" end as "Dep_Name"
from myemp;

/*Sub Query inside a case statement*/
 
select emp_id,first_name from (select emp_id,FIrst_name,last_name,dep_id,
case 
when dep_id=110 then "Accounts"
when dep_id=100 then "Finance"
when dep_id=90 then "Management"
when dep_id=80 then "Sales"
when dep_id=70 then "Public Relations"
when dep_id=60 then "Information Technology"
when dep_id=40 then "Human Resource"
when dep_id=20 then "Marketing"
else "Others" end as "Dep_Name"
from myemp) as a
where Dep_Name="Accounts";



select emp_id,FIrst_name,last_name,dep_id,Dep_Name
 from (select emp_id,FIrst_name,last_name,dep_id,
case 
when dep_id=110 then "Accounts"
when dep_id=100 then "Finance"
when dep_id=90 then "Management"
when dep_id=80 then "Sales"
when dep_id=70 then "Public Relations"
when dep_id=60 then "Information Technology"
when dep_id=40 then "Human Resource"
when dep_id=20 then "Marketing"
else "Others" end as "Dep_Name"
from myemp) as a
where Dep_Name="Accounts";

select * from (


select emp_id,FIrst_name,last_name,dep_id,
case dep_id
when 110 then "Accounts"
when 100 then "Finance"
when 90 then "Management"
when 80 then "Sales"
when 70 then "Public Relations"
when 60 then "Information Technology"
when 40 then "Human Resource"
when 20 then "Marketing"
else "Others" end as "Dep_Name"
from myemp


)a
where Dep_Name="Accounts";

-- Union all will combine all the data
select * from myemp where dep_id=90
union all
select * from myemp where dep_id in (100,90);

-- Union will combine all the data by eliminating the duplicates
select * from myemp where dep_id in (90,60)
union
select * from myemp where dep_id in (100,90);

-- Except will eliminate the values of second select statement from the first select statement
select * from myemp 
except 
select * from myemp where dep_id in (100,90);

-- Intersect will return only the matching values from both the select statements
select * from myemp where dep_id in (60,90);
intersect
select * from myemp where dep_id in (100,90);


SELECT emp_id, FIrst_name, last_name, dep_id,
IF(dep_id = 110, 'Accounts',
   IF(dep_id = 100, 'Finance',
      IF(dep_id = 90, 'Management',
         IF(dep_id = 80, 'Sales',
            IF(dep_id = 70, 'Public Relations',
               IF(dep_id = 60, 'Information Technology',
                  IF(dep_id = 40, 'Human Resource',
                     IF(dep_id = 20, 'Marketing', 'Others')))))))
) AS "Dep_Name"
FROM myemp;

SELECT MAX(SALARY) "1 MAXSALARY",
(SELECT MAX(SALARY) FROM myemp
WHERE SALARY < (SELECT MAX(SALARY) FROM myemp )) 
as "2 MAXSALARY" from myemp;
