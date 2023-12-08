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