show databases;
use classicmodels;
show tables;

#############################################################################################################################################################################################################
#################################################################################  Day 3 ####################################################################################################################
#############################################################################################################################################################################################################
-- Question 1
desc customers;
SELECT 
    customerNumber,
    customerName,
    state,
    creditLimit AS creditLim
FROM
    customers
WHERE
    (creditLimit BETWEEN 50000 AND 100000)
        AND (state IS NOT NULL)
ORDER BY creditLim DESC;

-- Question 2
desc products;
SELECT DISTINCT
    productline
FROM
    products
WHERE
    productline LIKE '% Cars';

#############################################################################################################################################################################################################
#################################################################################  Day 4 ####################################################################################################################
#############################################################################################################################################################################################################    

-- Question 1
desc orders;
SELECT 
    orderNumber, status, COALESCE(comments, '-') Comments
FROM
    orders
WHERE
    status = 'Shipped';
    
-- Question 2
desc employees;
SELECT 
    employeeNumber,
    firstName,
    jobTitle,
    CASE
        WHEN jobTitle = 'President' THEN 'P'
        WHEN jobTitle LIKE 'VP %' THEN 'VP'
        WHEN jobTitle = 'Sales Rep' THEN 'SR'
        ELSE 'SM'
    END jobTitle_abr
FROM
    employees
ORDER BY jobTitle;

#############################################################################################################################################################################################################
#################################################################################  Day 5 ############################################################################################################################
#############################################################################################################################################################################################################

-- Question 1
desc payments;
SELECT 
    YEAR(paymentDate) 'Year', MIN(amount) 'Min Amount'
FROM
    payments
GROUP BY YEAR(paymentDate)
ORDER BY YEAR(paymentDate);

-- Question 2
desc orders;
SELECT 
    YEAR(orderDate) 'Year',
    CONCAT('Q', QUARTER(orderDate)) 'Quarter',
    COUNT(DISTINCT customerNumber) 'Unique Customers',
    COUNT(orderNumber) 'Total Orders'
FROM
    orders
GROUP BY YEAR(orderDate) , CONCAT('Q', QUARTER(orderDate))
ORDER BY YEAR(orderDate) , 'Quarter';

-- Question 3
desc payments;
SELECT 
    LEFT(MONTHNAME(paymentDate), 3) 'Month',
    CONCAT(ROUND(SUM(amount) / 1000), 'K') 'formatted amount'
FROM
    payments
GROUP BY LEFT(MONTHNAME(paymentDate), 3)
Having sum(amount) between 500000 and 1000000
ORDER BY CONCAT(SUM(amount) / 1000, 'K') DESC;

#############################################################################################################################################################################################################
#################################################################################  Day 6 ############################################################################################################################
#############################################################################################################################################################################################################

-- Question 1
CREATE TABLE Journey (
    Bus_ID INT NOT NULL,
    Bus_Name VARCHAR(100) NOT NULL,
    Source_Station VARCHAR(50) NOT NULL,
    Destination VARCHAR(50) NOT NULL,
    Email VARCHAR(50) UNIQUE
);
desc Journey;

-- Question 2
CREATE TABLE Vendor (
    Vendor_ID INT PRIMARY KEY,
    Vendor_Name VARCHAR(100) NOT NULL,
    Email VARCHAR(200) UNIQUE,
    Country VARCHAR(100) DEFAULT 'N/A'
);
desc Vendor;

-- Question 3
CREATE TABLE movies (
    Movie_id INT PRIMARY KEY,
    movie_name VARCHAR(20) NOT NULL,
    release_year CHAR(4) DEFAULT '-',
    Cast VARCHAR(50) NOT NULL,
    Gender ENUM('Male', 'Female'),
    NO_of_shows INT UNSIGNED NOT NULL
);
desc movies;

-- Question 4
## a.Product Table
CREATE TABLE Product (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(20) UNIQUE NOT NULL,
    description VARCHAR(200),
    supplier_id INT,
    FOREIGN KEY (supplier_id)
        REFERENCES Supplier (supplier_id)
);
desc product;

## b.Supplier Table
CREATE TABLE Supplier (
    supplier_id INT AUTO_INCREMENT PRIMARY KEY,
    supplier_name VARCHAR(50),
    location GEOMETRY
);
desc Supplier;

## c.Stock Table
CREATE TABLE stock (
    id INT AUTO_INCREMENT PRIMARY KEY,
    balance_stock INT,
    product_id INT,
    FOREIGN KEY (product_id)
        REFERENCES Product (product_id)
);
desc stock; 

#############################################################################################################################################################################################################
#################################################################################  Day 7 ############################################################################################################################
#############################################################################################################################################################################################################
-- Question 1.
desc employees;
desc customers;
SELECT 
    e.employeeNumber,
    CONCAT(e.firstName, ' ', lastName) 'Sales Person',
    COUNT(c.customerNumber) 'Unique Customers'
FROM
    employees e
        INNER JOIN
    customers c ON e.employeeNumber = c.salesRepEmployeeNumber
GROUP BY e.employeeNumber
ORDER BY COUNT(c.customerNumber) DESC;

-- Question 2
desc Customers;
desc Orders;
desc Orderdetails;
desc Products;
SELECT 
    c.customerNumber,
    c.customerName,
    od.productCode,
    p.productName,
    od.quantityOrdered 'Ordered Qty',
    p.quantityInStock 'Total Inventory',
    p.quantityInStock - od.quantityOrdered 'Left Qty'
FROM
    Customers c
        INNER JOIN
    Orders o ON c.customerNumber = o.customerNumber
        INNER JOIN
    Orderdetails od ON o.orderNumber = od.orderNumber
        INNER JOIN
    Products p ON od.productCode = p.productCode
ORDER BY c.customerNumber , od.productCode;

-- Question 3
CREATE TABLE Laptop (
    Laptop_Name VARCHAR(50)
);
# Inserting arbitrary values in Laptop Table
INSERT INTO Laptop(Laptop_Name) Values
('APPLE'),
('Dell'),
('HP'),
('Lenovo'),
('Acer'),
('ASUS')
;
CREATE TABLE Colours (
    Colour_Name VARCHAR(10)
);
# Inserting arbitrary values in Colours Table
INSERT INTO Colours(Colour_Name) Values
('Black'),
('Silver'),
('White'),
('Green'),
('Red')
;
# Cross Join both tables to obtain desired result
SELECT 
    Laptop_Name, Colour_Name
FROM
    Laptop
        CROSS JOIN
    Colours;

-- Question 4 
CREATE TABLE project (
    EmployeeID INT PRIMARY KEY,
    FullName VARCHAR(20),
    Gender VARCHAR(10),
    MangerID INT
);
desc project;
INSERT INTO Project VALUES(1, 'Pranaya', 'Male', 3),
						  (2, 'Priyanka', 'Female', 1),
                          (3, 'Preety', 'Female', NULL),
						  (4, 'Anurag', 'Male', 1),
						  (5, 'Sambit', 'Male', 1),
                          (6, 'Rajesh', 'Male', 3),
                          (7, 'Hina', 'Female', 3);
select * from project;
## names of employees and their related managers.
SELECT 
    p2.FullName AS 'Manager Name', p1.FullName AS 'Emp_Name'
FROM
    Project p1
        INNER JOIN
    Project p2 ON p1.MangerID = p2.EmployeeID
ORDER BY p2.FullName;

#############################################################################################################################################################################################################
#################################################################################  Day 8 ############################################################################################################################
#############################################################################################################################################################################################################
-- Table Creation
CREATE TABLE facility (
    Facility_ID INT,
    Name VARCHAR(100),
    State VARCHAR(100),
    Country VARCHAR(100)
);

# Modification of Table
-- i)
ALTER TABLE facility
 MODIFY Facility_ID INT PRIMARY KEY AUTO_INCREMENT ;
-- ii)
AlTER TABLE facility
 ADD COLUMN City VARCHAR(100) NOT NULL AFTER Name;
 
-- output
DESC facility;

#############################################################################################################################################################################################################
#################################################################################  Day 9 ############################################################################################################################
#############################################################################################################################################################################################################
CREATE TABLE university (
    ID INT,
    Name VARCHAR(100)
);
INSERT INTO University
VALUES (1, "       Pune          University     "), 
		(2, "  Mumbai          University     "),
        (3, "     Delhi   University     "),
        (4, "Madras University"),
        (5, "Nagpur University");

/* 
By running the following query at least 4 times
Single Spacing between the first and second word of university name
can be obtained for every entry in the problem 
as maximum number of spaces  between the two words for any entry in problem = 10
1st Pass -- 10 spaces becomes 5 
2nd Pass -- 5 spaces becomes 3
3rd Pass -- 3 spaces becomes 2
4th pass -- 2 spaces becomes 1
*/
UPDATE university
SET Name = TRIM(REPLACE(Name,'  ', ' '));

-- output 
SELECT 
    *
FROM
    university;

#############################################################################################################################################################################################################
#################################################################################  Day 10 ############################################################################################################################
#############################################################################################################################################################################################################

-- Create View statement
CREATE VIEW product_sales (Year , Value) AS
    SELECT 
        YEAR(o.orderDate) AS Year,
        CONCAT(COUNT(od.quantityOrdered),
                ' (',
                ROUND((SUM(od.quantityOrdered * od.priceEach) / (SELECT 
                                SUM(quantityOrdered * priceEach)
                            FROM
                                orderdetails)) * 100),
                '% )') AS Value
    FROM
        orders o
            INNER JOIN
        orderdetails od ON o.orderNumber = od.orderNumber
    GROUP BY Year
    ORDER BY COUNT(od.quantityOrdered) DESC;

-- Query via the view
select * from product_sales;

#############################################################################################################################################################################################################
#################################################################################  Day 11 ############################################################################################################################
#############################################################################################################################################################################################################
-- Question 1
desc customers;
##### Stored Procedure creation Statement
/*
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetCustomerLevel`(cus_num integer)
BEGIN
select case 
when(creditLimit > 100000) then "Platinum"
when(creditLimit > 25000) then "Gold"
else "Silver"
End "Customer Level"
from customers
where customerNumber = cus_num ;
END
*/
## Call the Created Stored Procedure
call GetCustomerLevel(103);
call GetCustomerLevel(112);
call GetCustomerLevel(114);

-- Question 2 
##### Stored Procedure creation Statement
/*
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_country_payment`(payment_year integer, country varchar(50))
BEGIN
select year(paymentDate) `Year`, country, 
       concat(round(sum(amount)/1000),' K') as "Total Amount"
from customers c inner join payments p 
on c.customerNumber = p.customerNumber
where year(paymentDate) = payment_year
and c.country = country
group by year(paymentDate), country;
END
*/
## Call the Strored Procedure
call get_country_payment(2003,'France');

#############################################################################################################################################################################################################
#################################################################################  Day 12 ############################################################################################################################
#############################################################################################################################################################################################################

-- Question 1
desc orders;

select year(orderDate) as "Year",
       monthname(orderDate) as "Month",
       count(*) as "Total Orders",
       concat(round((count(*)- lag(count(*),1) over())*100/lag(count(*),1) over()), ' %') as ' % YoY Change'  
from orders
group by year(orderDate), monthname(orderDate); 

-- Question 2
## Table 'Emp_UDF' Creation 
create table Emp_UDF(
Emp_ID int primary key auto_increment,
Name varchar(50) not null,
DOB Date not null
);

## Data Inserttion into Table 'Emp_UDF'
INSERT INTO Emp_UDF(Name, DOB)
VALUES ("Piyush", "1990-03-30"), 
       ("Aman", "1992-08-15"), 
       ("Meena", "1998-07-28"), 
       ("Ketan", "2000-11-21"), 
       ("Sanjay", "1995-05-21");

select * from Emp_UDF;
desc Emp_UDF;
set global log_bin_trust_function_creators = 1;
/*
### calculate_age(DOB) definition :-

CREATE DEFINER=`root`@`localhost` FUNCTION `calculate_age`(DOB Date) RETURNS varchar(25) CHARSET latin1
BEGIN
    declare age_str varchar(25);
    select concat(year(current_date()) - year(DOB),' Years ',(month(current_date())-month(DOB)),' months') into age_str;
RETURN age_str;
END

*/
set sql_safe_updates = 0;
# output :- 
select *, calculate_age(DOB) Age from Emp_UDF;

#############################################################################################################################################################################################################
#################################################################################  Day 13 ############################################################################################################################
#############################################################################################################################################################################################################

-- Question 1
desc customers;
desc orders;
SELECT 
    customerNumber, customerName
FROM
    customers
WHERE
    customerNumber NOT IN (SELECT 
            customerNumber
        FROM
            orders);
            
-- Question 2
desc customers;
desc orders;

(SELECT 
    c1.customerNumber,
    c1.customerName,
    COUNT(o1.orderNumber) 'Total Orders'
FROM
    customers c1
        LEFT JOIN
    orders o1 ON c1.customerNumber = o1.customerNumber
GROUP BY customerNumber
ORDER BY customerNumber) 

UNION 

(SELECT 
    c2.customerNumber,
    c2.customerName,
    COUNT(o2.orderNumber) 'Total Orders'
FROM
    customers c2
        RIGHT JOIN
    orders o2 ON o2.customerNumber = c2.customerNumber
GROUP BY c2.customerNumber
ORDER BY c2.customerNumber);

-- Question 3
desc orderdetails;
SELECT 
    orderNumber, MAX(quantityOrdered) quantityOrdered
FROM
    orderdetails od1
WHERE
    quantityOrdered < (SELECT 
            MAX(quantityOrdered)
        FROM
            orderdetails od2
        WHERE
            od1.orderNumber = od2.orderNumber)
GROUP BY orderNumber;

-- Question 4 
SELECT 
    MAX(t1.Total) AS 'MAX(Total)', MIN(t1.Total) AS 'Min(Total)'
FROM
    (SELECT 
        orderNumber, COUNT(productCode) Total
    FROM
        orderdetails
    GROUP BY (orderNumber)) AS t1;
    
-- Question 5
desc products;

SELECT 
    p1.productLine, COUNT(*) Total
FROM
    products p1
WHERE
    p1.buyPrice > (SELECT 
            AVG(p2.buyPrice)
        FROM
            products p2
        WHERE
            p1.productLine = p2.productLine)
GROUP BY productLine
ORDER BY Total DESC;

# Alternate Way
select productLine, count(*) as 'Total'
from (select *, avg(buyPrice) over (partition by productline) as avg_price 
from products) as e
where e.buyPrice > e.avg_price 
group by productline
order by Total desc;

#############################################################################################################################################################################################################
#################################################################################  Day 14 ############################################################################################################################
#############################################################################################################################################################################################################

-- Table Creation
Create Table Emp_EH(
EmpID int primary key auto_increment,
EmpName varchar(25) not null,
EmailAddress varchar(50) not null
);
desc Emp_EH;
-- Procedure for data Entry in table
/*
CREATE DEFINER=`root`@`localhost` PROCEDURE `EMP_info_enter`(emp_name varchar(10), email varchar(15))
BEGIN

declare exit handler for sqlexception
    begin
         select "Error occurred " as msg;
    end;
    
-- Procedure Starts
    insert into Emp_EH(EmpName,EmailAddress) values(emp_name,email);
-- Procedure Ends
END
*/
-- Insert data into EMP_EH tables
call EMP_info_enter('Tom','tom@company.com');
call EMP_info_enter('Mary',null);
call EMP_info_enter(null,'mary@so.com');
select * from EMP_EH;

#############################################################################################################################################################################################################
#################################################################################  Day 15 ############################################################################################################################
#############################################################################################################################################################################################################

create table Emp_BIT(
Name varchar(30),
Ocuupation varchar(20),
Working_date date,
Working_hours int
);
INSERT INTO Emp_BIT VALUES
('Robin', 'Scientist', '2020-10-04', 12),  
('Warner', 'Engineer', '2020-10-04', 10),  
('Peter', 'Actor', '2020-10-04', 13),  
('Marco', 'Doctor', '2020-10-04', 14),  
('Brayden', 'Teacher', '2020-10-04', 12),  
('Antonio', 'Business', '2020-10-04', 11);  
/*
 ---- before insert trigger definition 
CREATE DEFINER=`root`@`localhost` TRIGGER `emp_bit_BEFORE_INSERT` BEFORE INSERT ON `emp_bit` FOR EACH ROW BEGIN
     case when new.Working_hours < 0 
     then
	     set new.Working_hours = -new.Working_hours;
	 End case;
END
*/

## Inserting negative vaule to check 
INSERT INTO Emp_BIT VALUES
('Tom', 'Politician', '2023-10-04', -12);
select * from Emp_BIT;