--  This is notes regarding DDL class 
--  this is how we comment
##########  create data base command ##########

create database exelr;

############use database as default schema ## must

use exelr;

CREATE TABLE people (
    id INT,
    Name VARCHAR(35),
    Age TINYINT,
    Gender CHAR(6),
    Phonenumber CHAR(10),
    Adharnumber CHAR(12)
);

####################### alter table commands ##########
-- 1. alter table
alter table people add salary float(5,2);
-- 2. drop a column
alter table people drop salary;
-- 3. drop table 
drop table people;
-- 4.drop database 
drop database exelr;
##########   assingments  ######################
## #####   1--- alter data type in any column ##
## #####    2--- alter the table name         ##
##########   assingments  ######################

## Extra--- look for it on net
-- search for "Data Model Automation"
-- server undexing in SQL