-- To know the name and type of table and views in 'sakila' database
select table_name, table_type 
from information_schema.tables
where table_schema = 'sakila'
order by 1;
-- To know the name and type of table in 'company_db' database
select table_name, table_type
from information_schema.tables
where table_schema = 'company_db'
order by 1;
-- Query to get only tables in database
# having some issue in this query find out why 
select table_name, table_type
from information_schema.tables
where table_schema = 'company_db' and table_type = 'base%'
order by 1;
-- query about name of views and wheter they are updatable
select table_name, is_updatable
from information_schema.views
where table_schema = 'sakila'
order by 1;
###################-- information about all columns in sakila database 
select * 
from information_schema.columns
where table_schema = 'sakila' and table_name = 'film'
order by ordinal_position;
########################################## Explore above query ############
-- information about all the columns in department table in company_db
select *
from information_schema.columns
where table_schema = 'company_db' and table_name = 'department';
-- information about all keys in company_db
select constraint_name, Table_name from information_schema.table_constraints 
where table_schema = 'company_db'
order by 2,1;
-- information about sakila database 
select table_name, constraint_name, constraint_type
from information_schema.table_constraints
where table_schema = 'sakila';
show databases;