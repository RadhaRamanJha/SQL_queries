####################################################################################################
####################################################################################################
########################### Join Assignment ########################################################
####################################################################################################
####################################################################################################
# 1. Get first name of employees whose working hour is greater than 35 hours
use company_db;
desc employee;
desc works_on;
select fname employee
from employee e
inner join works_on w
on e.ssn = w.essn
where w.hours > 35;

# 2. Get name of employees and dependents also filter only male dependents
desc dependent;
select concat(e.fname," ",e.lname) employee,
d.dependent_name Dependent
from employee e
inner join dependent d
on e.ssn = d.essn
where d.sex = "M";

# 3. Get the project names which has total working hours between 10 and 20 hours
desc project;
select p.pname project, sum(w.hours) total_working_hours
from project p
inner join works_on w
on p.pnumber = w.pno
where w.hours between 10 and 20
group by p.pname
order by total_working_hours;

# 4. Get Department name wise maximum salary
desc department;
desc employee;
select d.dnumber, d.dname department_name,
max(e.salary) max_salary_of_department
from department d
inner join employee e
on d.dnumber = e.dno
group by d.dnumber
order by max_salary_of_department desc;

# 5. Get the first name and depatment location of employee  who belong to dept location as "houston"
select e.fname employee_name, p.plocation 
from 
employee e inner join project p
on e.dno = p.dnum
where p.plocation = "Houston";

##############################################################################################################
##############################################################################################################
############################## Sub-Query Assignment ##########################################################
##############################################################################################################
-- select fname of those employees whose pno = 10,1,3 and their working hours is greater than 20  ###########
use company_db;
select fname desirable_employee
from employee
where 
ssn in
(select essn
from works_on
where pno in (10,1,3) 
and hours > 20 );