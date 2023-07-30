#SQL queries on data base company_db

# 1. Select query
# select all the columns in the table employee
select * from employee;

# get all the details department
select * from department;

# select fname and salary in employee
select fname,salary,dno from employee;


# select dname and dnumber in department table



#select Distinct i,e select unique values from column dno from employee
select distinct sex
from employee;

#get  distinct relationship values from dependent table
select distinct relationship
from dependent;

# aliases
# Retrieve First name and last name of ALL employees using alias
-- 1.
select fname as first_name
from employee;


-- 2. 
select fname  first_name
from employee;



# get dno with alias from employee




# WHERE 
#using where clause retrive the information
 #retrieve the details of all the female employee
 select *
 from employee
 where dno=5;

  #retrieve the table with project location as houston
  select * 
  from project
  where plocation = 'houston';
 
  #Retrieve details of all employees who draw a salary which is at least 30000 
  select * from employee 
  where salary>=30000;
 
 
  #AND
  
  select * from 
  employee
  where sex = 'm' or dno = 5;
  # not - exclude 
  # != , <>
  select * from employee
  where  dno <> 5;
  
  select * from employee
  where sex='m' and dno =5 and super_ssn <>'888665555';
  
  select * from employee
  where dno = 1 or dno=5;
  
  
  # Retrieve details of all male employees who draw a salary which is at least 30000   using AND 
  
  
 # get fname of all female employees who belongs to department 5

 
 #Retrieve details of projects that are based out Houston or Stafford

 
 # get details of all employees belongs to dno 5 or 4
 
 
 
 #NOT
 #retrieve the depart location which is NOT houston (where not) <> and !=




 # between 
 # get fname and salary of getting between 20k to 30k
 select * from employee
 where salary between 20000 and 30000;
 
 # get details of employees whose pno = 10 and working hours between 10 to 30 hours - works_on
 select * from works_on
 where pno = 1 and hours between 10 and 30;
 
 
 
 #LIKE operator - 
 #Display employees whose name begins with  (Hint: use LIKE() function as in address LIKE 'j%'
 
 
 #Display employees whose name ends with a "%a'
 select fname 
 from employee
 where fname like '%me%';

 
 
  # display the employee names where a in the second position "_a%"
 

 
 
 # between clause 
 # salary between 20 to 30 k
 
 
 # get all the details of the projects who worked bewteen 10 to 30 hours


 
 
 # IN and NOT in 
 # dno in 4 and 5
 select * from employee
 where dno = 4 or dno = 5;
 
select * from employee
 where dno not in (5,4);
 
 #  - details works on table who works for  pno 1,2,3,30,10
 select * from works_on
 where pno not in (1,2,3,30,10);
 
 # between
 select * from employee
 where salary between 30000 and 40000;
 
 # like 
 # get project names, dno  which has got ctX and ctY in their project name
 select pname,dnum from project
 where pname like '%ctx%' or pname like '%cty%';
 

 # get all the details of the project where project name is product x and product y also newbenefits
 
 
 

 # not in dep locations not in houstan
 
 
 #null
 
 # super_ssn is null
 select * from employee
 where salary is null;
 # get essn of emp who have got working hours a s null
 
 
 
 # dno is null



# is not null

 # order by clause
 # Display the employees sorted by their salary in ascending mode
 # fname and salary 
 select *
 from employee
 order by salary desc,dno desc;
 
 
 
 
select * from employee
limit 2;
# top three salary making people as output -- limit interview question
-- 	Use ORDER by SALARY (asc, desc)
select * from employee
where dno = 5
order by salary 
limit 3;


 
 # get details of person who is getting third highest salary
  # aws top and bottom  # offset (min,max,step size)
select * from employee
order by salary
limit 3;

#aggregation function

# display the female employees with min sal
select min(salary) , max(salary)
from employee
where sex = 'f';

select *  from employee
where salary = 25000.00;


# minimum hours in the works_on table for project 2



# what is the max salary in employee table


# count the number of female employees
select count(*),count(ssn), count(distinct ssn) as unq from employee
where sex = 'F';



# get count of total supervisors and unique supervisors
select count(*),count(super_ssn), count(distinct super_ssn) as unq from employee;

# get number of employees belongs to project number 1 - works on table
select count(distinct essn) total 
from works_on
where pno = 1;

# get the total number of projects in works on table out of which how many of them are unique



# sum the overall salary of male employees who belongs to dno 4
select sum(salary) as total, count(ssn) num
from employee
where sex = 'm' and dno = 5;


# get total working hours employee with id = essn 999887777 is investing on project 10
select sum(hours) as total 
from  works_on
where essn = '999887777' and pno = 10;

# # Display the average project hours avg() -- 
select round(avg(hours),2)average 
from works_on;

# Display the ssn and fully concatenated name of all employees
-- 	Use CONCAT function as in CONCAT(fname, ' ', minit, ' ', lname)
select concat(fname,'@', minit, ' ', lname) fullname
from employee;



# date functions
# year(), month() and day()
select bdate,year(bdate) year_bdate,
month(bdate) month_bdate, 
day(bdate) day_bdate from employee;

# group by

# Display the number of employees female in each department  (group by dno)
select dno,count(ssn) as total , sum(salary) total_sal
from employee
where sex ='f'
group by dno
order by total desc;

# get total working hours per each of the employee present in works on table
select essn,sum(hours)  total 
from works_on
group by essn
order by total desc
limit 3;

# get total salary per each gender and order it in increasing order
select sex , sum(salary) total
from employee
group by sex
order by total;

# get year of bday wise total salary


 # Display the average salary of employees (department-wise and gender-wise)
-- 	GROUP BY Dno, Sex
select dno,sex,avg(salary) 
from employee
group by dno,sex;


# Display the number of male employees in each department
select dno,sex,count(ssn) as num 
from employee
where sex = 'm'
group by dno;

 
#Display the number of projects per each location
# get total working hours of employees based on employee and pno
# get number of dependents per each employee in the company

 -- HAVING CLAUSE APPLIED ON AGGREGATED VALUES
 -- Display the Dno of those departments that has 4 employees
 select count(ssn) as num, sum(salary) as total_sal, dno
 from employee
 group by dno
 having num = 4 and total_sal = 133000.00;
 

 # Display the sum of salary in each department that has salary as 55000
select sum(salary) total , dno
from employee
group by dno
having total = 55000;


# get total working hours per each employee and filter 
-- those employees whose total hours is greater than 25 hours
select essn,sum(hours) as total
from works_on
group by essn
having total > 25;

 
# interview display the duplicate records
# display duplicate ids(super_ssn) in employee table based on id(super_ssn) 
select super_ssn, count(super_ssn) as id
from employee
group by super_ssn
having id>1;


#JOINS

-- Inner join
-- inner join the two tables employee and department

 select * 
 from employee 
 inner join department
 on employee.dno = department.dnumber;

  #small variation to the above query to write it optimistically
select *
from employee e 
inner join department m   # aliases
on e.dno=m.dnumber;
  
  # right join
  select * 
  from employee e 
  right join works_on d   # aliases
on e.ssn=d.essn;
  
  #left join
select * 
from employee e 
left join dependent d   # aliases
on e.ssn=d.essn;

# union





 # sub queries
  
    # Display the fname and salary of employees whose salary is more than the average salary of all the employees
  
  
  -- Display the first name of employees working in the research  department 
  


# get count of persons who are in employee table are also in works on table imp

    


# ranking functions in sql

# rank
# The RANK() function is a window function that assigns a rank to each row within a partition of a result set.

# rank each employee based on salary
SELECT
	fname,
	sex,
	salary,
	RANK () OVER ( 
		ORDER BY salary DESC
	) rank1
FROM
	employee;
    
    
    # assignment  rank working hours of each employee in works on table
    
    
    # partitioning rank by dno
    
    SELECT
	fname,
	sex,
	salary,
    dno,
	RANK () OVER ( 
		PARTITION BY dno
		ORDER BY salary DESC
        ) price_rank_bydno
FROM
	employee;
    
     # assignment  rank working hours of each employee in works on table and partition by pno
     
     # row number
     
     SELECT
	fname,
	sex,
	salary,
    rank () OVER ( 
		ORDER BY salary DESC
	) rank1,
    row_number () OVER ( 
		ORDER BY salary DESC
	) row_num 
FROM
	employee;
    
    

  
  # lead
  SELECT 
	fname,
    ssn,
	salary,
	LEAD(salary,2) OVER (
		ORDER BY salary desc
	) next_person_salary
FROM 
	employee;
    
    # lag
    SELECT 
	fname,
    ssn,
	salary,
	LAG(salary,1) OVER (
		ORDER BY salary desc
	) next_person_salary
FROM 
	employee
    ;
    
    
    # views in SQL
    
CREATE VIEW first_view AS
SELECT
	fname,
	sex,
	salary,
    rank () OVER ( 
		ORDER BY salary DESC
	) rank1,
    row_number () OVER ( 
		ORDER BY salary DESC
	) row_num 
FROM
	employee;

select * from first_view
WHERE fname = 'James';

# replacing the present view
CREATE OR REPLACE VIEW first_view AS
SELECT *
FROM employee
WHERE fname = 'James';


# dropping the view
drop view first_view;

# create the view for total salaries of all the employee dep wise



  
  # case statement for salary > 30k ,=30k and less than 30k (fname, salary)
CREATE VIEW new_view AS
  SELECT salary, fname,
CASE
    WHEN salary > 30000 THEN 'The salary is greater than 30k'
    WHEN salary = 30000 THEN 'The salary is 30k'
    ELSE 'The salary is under 30k'
END AS salaryText
FROM employee;
  
 
