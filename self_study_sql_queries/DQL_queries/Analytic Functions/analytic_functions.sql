use sakila;
-- using rank() and over() function
select quarter(payment_date) quarter,
monthname(payment_date) sales_month,
sum(amount) monthly_sales,
rank() over(order by sum(amount) desc) sales_rank
from payment
group by quarter(payment_date), monthname(payment_date)
order by 1,2;
-- Partitioning the data to generate ranking for each quarter
select quarter(payment_date) quarter,
monthname(payment_date) sales_month,
sum(amount) monthly_sales,
rank() over(partition by(quarter(payment_date)) order by sum(amount) desc) sales_rank
from payment
group by quarter(payment_date), monthname(payment_date)
order by 1,2;
-- using all the threee ranking function simultaneously 
select customer_id, count(*) num_rental,
row_number() over(order by count(*) desc ) row_num_rnk,
rank() over(order by count(*) desc) rank_rnk,
dense_rank() over(order by count(*) desc) dense_rank_rnk
from rental
group by 1
order by 2 desc;
-- genetrating rank for every month
select customer_id, 
monthname(rental_date) month_name,
count(*) num_rental,
rank() over(partition by(monthname(rental_date)) order by count(*) desc) rank_rnk
from rental
group by 1,2
order by 2;
-- extraction of first five customer for each month using rank() function
select customer_id, month_name, num_rental, rank_rnk 
from (select customer_id, 
monthname(rental_date) month_name,
count(*) num_rental,
rank() over(partition by(monthname(rental_date)) order by count(*) desc) rank_rnk
from rental
group by 1,2
order by 2) cust_rank
where rank_rnk <= 5
order by 2,4;
-- extraction of first five customer for each month using row_number() function
select customer_id, month_name, num_rental, rank_rnk 
from (select customer_id, 
monthname(rental_date) month_name,
count(*) num_rental,
row_number() over(partition by(monthname(rental_date)) order by count(*) desc) rank_rnk
from rental
group by 1,2
order by 2) cust_rank
where rank_rnk <= 5
order by 2,4;
-- extraction of first five customer for each month using dense_rank() function
select customer_id, month_name, num_rental, rank_rnk 
from (select customer_id, 
monthname(rental_date) month_name,
count(*) num_rental,
dense_rank() over(partition by(monthname(rental_date)) order by count(*) desc) rank_rnk
from rental
group by 1,2
order by 2) cust_rank
where rank_rnk <= 5
order by 2,4;
-- claculation of total payment amount for every month using window functions
-- not group by clause
select distinct monthname(payment_date) month_nm,
sum(amount) over(partition by(monthname(payment_date))) monthly_payment,
sum(amount) over() grand_total
from payment
order by monthly_payment desc;
-- calculation of percentage payment for each month using above query
select month_nm, round((monthly_payment/grand_total)*100,2) pct_total
from 
(select distinct monthname(payment_date) month_nm,
sum(amount) over(partition by(monthname(payment_date))) monthly_payment,
sum(amount) over() grand_total
from payment) monthly_payment
order by pct_total desc;
-- genrate monthly or grand total for all payments of $10 or higher
select monthname(payment_date) month_nm,
amount,
sum(amount) over(partition by monthname(payment_date)) monthly_total,
sum(amount) over() grand_total
from payment
where amount >= 10
order by 1;
-- Monthly payment percentage w.r.t total payment reporting
select monthname(payment_date) month_name,
sum(amount) monthly_payment,
round((sum(amount)/(sum(sum(amount))over()))*100,2) pct_total
from payment
group by 1
order by 1;
-- Monthly payment comparsion reporting
select monthname(payment_date) month_nm,
sum(amount) monthly_payment,
case sum(amount)
when max(sum(amount)) over() then "Highest"
when min(sum(amount)) over() then "Lowest"
else "Medium"
end "description"
from payment
group by month_nm;
