use anadb;

select * from movies;

select * from members;

select id,title,category,first_name,last_name from movies
inner join
members
on movies.id=members.movieid;

select id,title,category,first_name,last_name from members
inner join
movies
on movies.id=members.movieid;

select id,title,category,first_name,last_name from movies as mo
inner join
members as mm
on mo.id=mm.movieid;

select title,category,first_name,last_name from movies as mo
join
members as mm
on mo.id=mm.movieid;

select title,category,first_name,last_name from movies as mo
join
members as mm
on mo.id=mm.movieid;

select id,title,category,first_name,last_name from movies as mo
left join
members as mm
on mo.id=mm.movieid;

select title,category,ifnull(first_name,"-") first_name,ifnull(last_name,"-") from movies as mo
left join
members as mm
on mo.id=mm.movieid;

select title,category,ifnull(first_name,"No Name") ,ifnull(last_name,"No Name") from movies as mo
left join
members as mm
on mo.id=mm.movieid;

select title,category,coalesce(first_name,"NA") ,coalesce(last_name,"NA") from movies as mo
left join
members as mm
on mo.id=mm.movieid;

select title,category,first_name,last_name from movies as mo
right join
members as mm
on mo.id=mm.movieid;

select ifnull(title,"No Movie") As Title_Name,ifnull(category,"No Category") As "Category",
first_name,last_name from movies as mo
right join
members as mm
on mo.id=mm.movieid;

/*Cross Join*/

select * from movies as mo
CROSS join
members as mm;

select * from meals;

select * from drinks;

select * from meals cross join drinks;

select mealname,drinkname,rate,rate 
from meals cross join drinks;

select mealname,drinkname,meals.rate,drinks.rate from meals cross join drinks;

select title,category,first_name,last_name from movies as mo cross join members as mm;

select mealname,drinkname,me.rate,dr.rate from meals as me
cross join drinks dr;

select mealname,drinkname,dr.rate as Drink_rate from meals as me
cross join drinks dr;

select mealname Meal_name,drinkname drink_name ,sum(me.rate + dr.rate) as Total from meals as me
cross join drinks dr
group by Meal_name,drink_name;

select mealname Meal_name,drinkname drink_name ,(me.rate + dr.rate) as Total from meals as me
cross join drinks dr;

select sum(me.rate) from meals as me
cross join drinks dr;

select sum(me.rate) from meals as me;

/*for self join*/

select * from myemp;

select emp.emp_id,emp.First_name,emp.last_name,mgr.first_name,
mgr.last_name from myemp as emp
join 
myemp as mgr
on emp.mgr_id=mgr.emp_id;

/*Dense Rank Function*/

select emp_id,first_name,last_name,salary, 
dense_rank() over (order by salary) as "Rank"
from myemp;

select emp_id,first_name,last_name,salary, 
dense_rank() over (order by salary desc) as "Rank"
from myemp;

select emp_id,first_name,last_name,job_id,salary, 
dense_rank() over (partition by job_id order by salary) as "Rank"
from myemp;

select emp_id,first_name,last_name,job_id,salary, 
dense_rank() over (partition by job_id order by salary desc) as "Dense Rank"
from myemp;

/*Rank Function*/

Use anadb;

select * from myemp order by salary;

select emp_id,first_name,last_name,salary, 
rank() over (order by salary) as "Rank"
from myemp;

select emp_id,first_name,last_name,salary, 
rank() over (order by salary desc) as "Rank"
from myemp;

select emp_id,first_name,last_name,job_id,salary, 
rank() over (partition by job_id order by salary) as "Rank"
from myemp;

select emp_id,first_name,last_name,job_id,salary, 
rank() over (group by job_id order by salary) as "Rank"
from myemp;

select emp_id,first_name,last_name,job_id,salary, 
rank() over (partition by job_id order by salary desc) as "Rank"
from myemp;

/*Percent Rank*/

select emp_id,first_name,last_name,job_id,salary, 
percent_rank() over (partition by job_id order by salary desc) as "Rank"
from myemp;

/*without partition percent rank will not make any sense*/
select emp_id,first_name,last_name,salary, 
percent_rank() over (order by salary desc) as "Rank"
from myemp;

/*Row Number*/

select * from myemp;

select emp_id,first_name,last_name,dep_id,salary, 
row_number() over (partition by dep_id order by salary desc) as "Row Number"
from myemp;



select job_id,count(*) from myemp group by job_id;

/*ntile*/
select emp_id,first_name,last_name,dep_id,salary, 
ntile(3) over (partition by dep_id order by salary desc) as "Tile Group"
from myemp;


/*get me the details of  In Process status for all the customers*/

/*get me the details customers who has not given any cheque*/

select ref_id,Full_name,Country from table2
where ref_id not in 
(select distint ref_id from tble1 where ref_id is not null)

use test;
SELECT
    c.customerNumber,
    customerName,
    orderNumber,
    status
FROM
    customers c
LEFT JOIN orders o 
    ON c.customerNumber = o.customerNumber
    where status ="In Process";
    
    
    SELECT
    c.customerNumber,
    customerName,
    checknumber
FROM
    customers c
Left JOIN Payments p 
    ON c.customerNumber = p.customerNumber
    where checknumber is null;
    
    
    
CREATE TABLE lead_lag (
    c_id INT PRIMARY KEY,
    start_date DATE,
    end_date DATE
);


INSERT INTO lead_lag (c_id, start_date, end_date)
VALUES
    (1, '2015-02-01', '2015-02-04'),
    (2, '2015-02-02', '2015-02-05'),
    (3, '2015-02-03', '2015-02-07'),
    (4, '2015-02-04', '2015-02-06'),
    (5, '2015-02-06', '2015-02-09'),
    (6, '2015-02-08', '2015-02-10'),
    (7, '2015-02-10', '2015-02-11');
    
select * from lead_lag;

Select c_id, start_date,  
        lag (start_date) over (order by start_date desc) as 'Lead_date' 
                   from lead_lag;
                   

Select c_id, start_date, end_date, 
        lead (start_date,2,"No Data") over (order by start_date) as 'Lead_date' 
                   from lead_lag;
                   
Select c_id, start_date, end_date, 
        nth_value (start_date,5) over (order by start_date) as 'Nth_value' 
                   from lead_lag;

Select c_id, start_date, end_date,  lead (start_date) over (order by start_date) as 'Lead_date',
        end_date - lead (start_date) over (order by start_date) + 1 as 'no_of_days' 
                   from lead_lag;
                   
Select c_id, start_date,  
       lag (start_date,2,"No Data") over (order by start_date) as 'Lag_date' 
                   from lead_lag;

Select c_id, start_date, end_date, lag (start_date) over (order by start_date) as 'Lag_date' ,
        end_date - lag (start_date) over (order by start_date) - 1 as 'deadline' 
                   from lead_lag;