show databases;
use excelr;
show tables;

#=======
# Create modify users , and where they can connect from
#=======
create user 'mukund'@localhost identified by 'password123';
grant create, alter, drop, insert, update, delete, select, references, reload on *.* to 'mukund'@localhost with grant option;
flush privileges;

update mysql.user set host='%' where host='localhost' and user='mukund';
grant all privileges on *.* to 'mukund'@'%' identified by 'password123' with grant option;
