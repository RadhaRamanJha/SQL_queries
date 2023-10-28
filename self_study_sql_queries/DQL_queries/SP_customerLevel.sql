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