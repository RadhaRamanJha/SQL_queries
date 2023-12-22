use mysqldb;
## Q1:- 
select * from offices;
select * from employees;
SELECT 
    country, CONCAT(e.firstName, ' ', e.lastName) 'Full Name'
FROM
    employees e
        INNER JOIN
    offices o ON e.officeCode = o.officeCode
WHERE
    country = 'USA';
## Q2:- 
select * from customers;
SELECT 
    *
FROM
    payments;
select c.customerName,p.amount from customers c inner join payments p on c.customerNumber = p.customerNumber order by p.amount desc limit 1;
## Q3 :- 
SELECT 
    c.customerName
FROM
    customers c
WHERE
    c.customerNumber IN (SELECT 
            customerNumber
        FROM
            payments
        WHERE
            amount > (SELECT 
                    AVG(amount)
                FROM
                    payments));
## Q4 :- 
select * from orders;
select * from customers;
SELECT 
    c.customerName
FROM
    customers c
WHERE
    c.customerNumber NOT IN (SELECT 
            o.customerNumber
        FROM
            orders o);
## Q5 :- 
select * from products;
SELECT 
    productName
FROM
    products
WHERE
    buyPrice > (SELECT 
            AVG(buyPrice)
        FROM
            products);
## Q6 :- 

select * from orderdetails;
SELECT 
    orderNumber, SUM(quantityOrdered * priceEach) total_amount
FROM
    orderdetails
GROUP BY orderNumber
HAVING total_amount > 60000
ORDER BY total_amount DESC;

## Q7 :- 
SELECT 
    cu.customerNumber,
    customerName,
    orderdetails.orderNumber, SUM(priceEach * quantityOrdered) total
FROM
    customers CU
    left join
	Orders
on cu.customerNumber=orders.customerNumber
    left join
	orderdetails 
on orders.orderNumber=orderdetails.orderNumber
GROUP BY orderNumber , cu.customerNumber, customerName
HAVING SUM(priceEach * quantityOrdered) > 60000;
;

## Q8 :- 
/* Find out the name of the sales rep who has handled the customers along with the customer and check details where at least one check is available for a customer */
select * from customers;
select * from employees;
SELECT 
    c.customerName,
    CONCAT(e.firstName, ' ', e.lastName) SalesRep
FROM
    customers c
        INNER JOIN
    employees e ON c.salesRepEmployeeNumber = e.employeeNumber
WHERE
    c.creditLimit > 5000;

## Q9 :- 
/*Find out the list of product codes available under the order number 10123*/ 
select * from orders;
select * from products;
select * from orderdetails;
SELECT 
    productCode
FROM
    orderdetails
WHERE
    orderNumber = 10123;

## Q10 :- 
/* Get the text description of all the products */
SELECT 
    p.productName
FROM
    products p
        INNER JOIN
    orderdetails o ON p.productCode = o.productCode
WHERE
    o.orderNumber = 10123;

## Q11 :- 
/*Get the order, order details and product name of all the orders*/
SELECT 
    o.orderNumber,
    p.productName,
    od.quantityOrdered,
    (od.quantityOrdered * od.priceEach) amount
FROM
    orders o
        INNER JOIN
    orderdetails od ON o.orderNumber = od.orderNumber
        INNER JOIN
    products p ON p.productCode = od.productCode;


## Window Functions 
select * from products;
## Rank, Dense_Rank and rownumber
select concat(customerName,' ',contactLastName) Customer_name,
       phone,
       rank()over(order by (creditLimit) desc) as "Rank",
       dense_rank()over(order by (creditLimit) desc) as "Dense_Rank",
       row_number()over(order by (creditLimit) desc) as "Row number"
       from customers;
## Partition by 
select productName,productLine,
	   (quantityInStock*buyPrice) estimated_revenue,
       rank() over(partition by(productLine) 
       order by (quantityInStock*buyPrice) desc) selling_priority
       from products;

## ntile 
select productName,productLine,
	   (quantityInStock*buyPrice) estimated_revenue,
       ntile(5) over(partition by(productLine) 
       order by (quantityInStock*buyPrice) desc) selling_priority
       from products;

## Lead
select productName,productLine,
	   (quantityInStock*buyPrice) estimated_revenue,
       lead((quantityInStock*buyPrice),2) over(partition by(productLine) 
       order by (quantityInStock*buyPrice) desc) lead_prduct_2
       from products;
## Lag
select productName,productLine,
	   (quantityInStock*buyPrice) estimated_revenue,
       lag((quantityInStock*buyPrice),2,"No Data") over(partition by(productLine) 
       order by (quantityInStock*buyPrice) desc) lead_prduct_2
       from products;