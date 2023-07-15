#This script is for DML - just for knowledge not for interview
use excelr;
# insert
INSERT INTO info (id, name, age) 
VALUES (1,'sam',27),
(2,'john',24),
(3,'josh',27),
(4,'rosh',29);
truncate info;


# UPDATE Table_name SET [column_name1= value_1, ….., column_nameN = value_N] WHERE CONDITION;  

update info set name = 'ram' where id = 1;

#DELETE FROM Table_Name WHERE condition;
DELETE FROM info WHERE id = 1;

truncate p_info;



 