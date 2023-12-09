use company_db;
# union 
select * from employee
union 
select * from employee;
select fname, salary, lname from employee
union
select  fname, salary, lname from employee;
# union all -- allows to have dublicate records
select * from employee
union all
select * from employee;

# Subquery

## Display firstname and salary of employess whose salary greater than average salary
select fname, salary 
from employee
where salary > (select avg(salary) from employee);
# Display fname of employee in research depatment

select fname 
from employee
where dno in (select dnumber from department where dname = "Research");

# interview question
# Get fname, ssn of employees who are in employee table and dependent table
select fname, ssn 
from employee
where ssn in (select distinct essn from dependent);

# Window function
-- Ranking function
# It is window function because for each entry we will get a value
-- Rank()
# rank each employee based on salary 
select *, Rank() over(
order by salary desc
) rank_salary
from employee;

# Ranking the employee based on their descreasing working hours
select distinct fname,  hours, Rank() over(
order by hours desc
) working_rank
from employee e
inner join works_on w
on e.ssn = w.essn ;

select fname, hours, Rank() over(
order by hours desc
) working_rank
from employee e
inner join works_on w
on e.ssn = w.essn ;

# Ranking the employee based on their increasing working hours
select distinct fname, hours, Rank() over(
order by hours desc
) working_rank
from employee e
inner join works_on w
on e.ssn = w.essn;
# Rank
select *, rank() over(
order by salary
) rank_salary
from employee;
# Dense rank 
select *, dense_rank() over(
order by salary
) rank_salary
from employee;

# Partition Rank by department
select 
fname,
sex,
salary,
dno,
dense_rank() over (
partition by dno
order by salary desc
) salary_rank_by_dno,
row_number() over (
partition by dno
order by salary desc
) row_num
from 
employee;