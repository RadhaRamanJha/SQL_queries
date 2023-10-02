#**********************************************************************************
# This is the script for DDL - just for knowledge 
#***********************************************************************************
# create new data base name
create database excelr;

# use the data base as default Shema - must
use excelr;

# Table - # to run ctrl+enter
# create table with columns as id, name,age - info
create table info(
id int,
name char(25),
age int);

# alter table 
# add sal
alter table info add salary float;

# alter table drop salary column
alter table info drop salary;

# alter - assignment 
# write a query to alter data type of any column in the above table
# write a query to rename the table 

# truncate Table
truncate info;

#drop table
drop table info;


# drop database
drop database excelr;

