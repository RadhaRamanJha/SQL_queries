use sakila;
desc rental;
-- using rank() function
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
order by 2 desc limit 10;
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
-- use of data frame to calcualte rolling sum of payment for sucsessive year week
select yearweek(payment_date) payment_week,
sum(amount) week_payment,
sum(sum(amount))
over(order by yearweek(payment_date) rows unbounded preceding) rolling_sum
from payment 
group by 
yearweek(payment_date)
order by 1;
-- use of data frame to calcualte rolling sum of payment for sucsessive year month
select month(payment_date),
sum(amount) monthly_payment,
sum(sum(amount))
 over(order by month(payment_date) rows unbounded preceding) rolling_sum
 from payment
 group by 
 month(payment_date)
 order by 1;
-- use data frame to calculate 5-week rolling average of paymwent
select yearweek(payment_date) year_week,
sum(amount) weekly_payment,
avg(sum(amount))
over(order by yearweek(payment_date)
 rows between 2 preceding and 2 following) rolling_5wk_avg
from payment
group by yearweek(payment_date)
order by 1;
-- use data frame window to calculate 7 day average payment 
select date(payment_date) payment_date,
sum(amount)  daily_payment,
round(avg(sum(amount)) over(order by date(payment_date)
range between interval 3 day preceding
and interval 3 day following),2) 7_day_avg
from payment
where payment_date between '2005-07-01' and '2005-10-01'
group by date(payment_date)
order by 1;
-- use of lag function to calculate the percentage difference in payment from prior week
select yearweek(payment_date) payment_week,
sum(amount) week_payment,
round((sum(amount)-lag(sum(amount),1)
over(order by yearweek(payment_date)))
/lag(sum(amount),1)
over(order by yearweek(payment_date))
*100,1 ) prcnt_diff
from payment
group by yearweek(payment_date)
order by 1;
-- Group Value Concatenation
## not an analytical function
## used to pivot a set of values
## in a single delimted string
## used to generate XML or JSON document
select f.title movie,
group_concat(a.last_name order by a.last_name separator ',') actors
from actor a
inner join film_actor fa on fa.actor_id = a.actor_id
inner join film f on f.film_id = fa.film_id
group by f.title
having count(*) = 3;