use anadb;

show tables;

select * from myemp;

select * from myemp limit 25;

select emp_id,first_name,last_name,salary from myemp;

select emp_id,first_name,last_name,salary from myemp limit 10;

select emp_id,first_name,last_name,salary+1000 from myemp;

select emp_id,first_name,last_name,salary+1000 as"Total_salary" from myemp;

select emp_id,first_name,last_name,salary*0.10 "New_Salary"
from myemp;

select emp_id,First_name,Last_name,salary,(salary*0.10) "Bonus",(salary*0.10)+Salary as "Total_salary"
from myemp;

select emp_id,first_name,last_name,salary,salary*0.15 from myemp limit 10;

select emp_id as EMP,first_name,last_name,
salary,salary*0.15 as Bonus from myemp limit 10;

select salary,salary*0.15 from myemp;

select emp_id,first_name,last_name,salary,
salary*0.15 as Penalty,salary-(salary*0.15) Total from myemp limit 10;

select emp_id,first_name,last_name,salary,salary*0.10 as Fine,salary-(salary*0.10) as Total from myemp limit 10;

select dep_id from myemp;

select distinct dep_id from myemp;

select dep_id,job_id from myemp;

select distinct dep_id,job_id from myemp;

select emp_id,salary>10000 from myemp;

select emp_id,first_name,last_name,salary,dep_id  from myemp where salary>=10000
and dep_id=80;

select emp_id,first_name,last_name,salary,dep_id  from myemp where salary>=10000
or dep_id=80;

select emp_id,first_name,last_name,salary,dep_id  from myemp where salary between 10000 and 11000;

select emp_id,first_name,last_name,salary,dep_id  from myemp where salary >= 10000 and salary < 11000;

select emp_id,first_name,last_name,salary,dep_id  from myemp where salary  not between 10000 and 11000;

select * from myemp where salary != 10000;

select * from myemp where salary <> 10000;

/*another table*/

select * from person;

select distinct fname from person;

select distinct lname from person;

select distinct fname,lname from person;

select * from myemp where dep_id=60 and salary<>6000;

select * from myemp where dep_id=80 and salary>10000;

select * from myemp where dep_id=80 and salary>=10000;

select * from myemp where dep_id=80 and salary>10000 order by hire_date desc,salary asc;

select * from myemp where dep_id=80 and salary<=10000;

select * from myemp where dep_id=80 and salary 
between 10000 and 14000 order by salary asc,first_name desc;

select first_name,last_name from myemp order by first_name asc,last_name desc;

select * from myemp where dep_id=80 and salary>10000 order by salary;

select * from myemp where dep_id=80 and salary>10000 order by emp_id,salary;

select dep_id from myemp;

select distinct dep_id,first_name from myemp;

select distinct dep_id from myemp order by dep_id;

select distinct dep_id from myemp order by dep_id desc;

select * from myemp where dep_id=80 and salary>10000 order by hire_date desc;

select * from myemp where dep_id=80 and salary>10000 order by first_name;

select * from myemp where dep_id=80 and salary>10000 order by first_name desc;

select distinct dep_id from myemp where dep_id != 80 order by dep_id desc;

select distinct dep_id from myemp where dep_id <> 80 order by dep_id desc;

select * from myemp where dep_id=80 or salary<5000;

select * from myemp where dep_id=80 or dep_id=60;

select * from myemp where dep_id=80 or dep_id=10 or dep_id=60;

select * from myemp where dep_id in (80,60);

/*Like Operator refer Notes*/

select * from myemp where first_name like "ja%";

select * from myemp where first_name like "%a";

select * from myemp where first_name like "%on%";

select * from myemp where first_name like "a____";

select * from myemp where first_name like "____n";

select * from myemp where first_name like "____";

select * from myemp where first_name like "%lex%";

select * from myemp where first_name="lex";

select current_date;

select current_time;

select current_timestamp;

select year(hire_date) from myemp;

select distinct year(hire_date) as "Hire_date" from myemp;

select distinct year(hire_date) from myemp order by year(hire_date);

select distinct year(hire_date) from myemp order by year(hire_date) desc;

select distinct month(hire_date) from myemp;

select distinct monthname(hire_date) from myemp;

select distinct quarter(hire_date) from myemp;

select distinct day(hire_date) from myemp;

select distinct dayname(hire_date) from myemp;

select now();

select distinct hire_date,dayname(hire_date) from myemp;

select distinct hire_date,dayname(hire_date) from myemp order by hire_date desc;

select distinct hire_date,dayname(hire_date) from myemp order by dayname(hire_date) desc;

select distinct hire_date,dayname(hire_date) from myemp order by dayofweek(hire_date);

select distinct hire_date,monthname(hire_date) from myemp order by dayofmonth(hire_date);

select distinct hire_date,monthname(hire_date) from myemp order by hire_date desc,dayofmonth(hire_date)  desc;

select * from myemp where first_name is not null;

select * from myemp where first_name is null;

select datediff(current_date,"2023-01-01");

select datediff("2023-01-01",current_date) as "Total_days";

select datediff("2023-01-01","2023-02-28");

select emp_id,first_name,last_name,salary,salary*0.235 as Bonus from myemp limit 10;
select emp_id,first_name,last_name,salary,truncate(salary*0.235,1) as Bonus from myemp limit 10;
select emp_id,first_name,last_name,salary,salary*0.10 as Fine,salary/(salary*0.15) as Total 
from myemp limit 10;

select emp_id,first_name,last_name,salary,salary*0.10 as Fine,truncate(salary/(salary*0.15),2) as Total 
from myemp limit 10;

select emp_id,first_name,last_name,salary,salary*0.10 as Fine,round(salary/(salary*0.15),2) as Total 
from myemp limit 10;

select emp_id,first_name,last_name,salary,round(salary*0.15,1) as Bonus from myemp limit 10;

select emp_id,first_name,last_name,round(salary,1),round(salary*0.15,1) as Bonus from myemp limit 10;

select lcase(first_name) from myemp;

select ucase(first_name) from myemp;

select length(first_name) from myemp;

select length("vimal raj");

select substring("vimalraj",2,5) ;

select first_name,length(first_name) from myemp;

select first_name,substring(first_name,2,5) from myemp;

select first_name,last_name from myemp;

select concat(first_name,last_name) from myemp;

select concat(first_name," ",last_name) as "Name" from myemp;

/* LTRIM, RTRIM, TRIM functions removes the spaces if any on specified string*/

select sum(salary) from myemp;

select avg(salary) from myemp;

select round(avg(salary),3) from myemp;

select truncate(avg(salary),3) from myemp;

select max(salary) from myemp;

select min(salary) from myemp;

select max(salary) "max",min(salary) "min" from myemp;

select count(*) from myemp;

select max(length(first_name)) as "Length",FIRST_NAME from myemp
group by first_name;

select count(*) from 4to6 class;

select count(*),gender from 4to6class group by gender;

avg
sum
product
count
min
max

select max(FIRST_NAME) as "Name" from myemp;

select dep_id,count(*) from myemp
where dep_id in (50,60,80)
group by dep_id;

select dep_id,count(*) from myemp
group by dep_id
having dep_id in (50,60,80);

select truncate(0.128,2);
select round(salary,1) from myemp;

select count(dep_id) from myemp;

select count(distinct dep_id) from myemp;

select distinct count(dep_id) from myemp;

select distinct dep_id,sum(salary) from myemp group by dep_id order by dep_id;

select dep_id,sum(salary) from myemp group by dep_id order by dep_id desc;

select dep_id,sum(salary) from myemp where dep_id =80 group by dep_id;

select dep_id,sum(salary) from myemp where dep_id in (80,10) group by dep_id order by dep_id;

select dep_id,sum(salary) from myemp group by dep_id having dep_id >50;

select dep_id,sum(salary) from myemp where dep_id>50 group by dep_id;

select dep_id,sum(salary) from myemp group by dep_id having dep_id>50;

use anadb;

select dep_id,sum(salary) from myemp  group by dep_id having dep_id >50 order by dep_id desc;

select dep_id,sum(salary) from myemp group by dep_id having dep_id in (50,60,10) order by dep_id desc;

select * from members where movieid is not null and first_name like '%ZZ%';

select * from members where movieid is null;

select * from members where movieid is not null;