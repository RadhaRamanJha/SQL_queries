use sakila;
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