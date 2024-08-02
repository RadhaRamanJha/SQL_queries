use anadb;

drop table pet;

CREATE TABLE pets (
         name VARCHAR(20), 
         owner VARCHAR(20), 
         species VARCHAR(20), 
         sex CHAR(1) default "m", 
         birth DATE, 
         death year
         ); 
         
         DESCRIBE PETs;
         
         SHOW COLUmns FROM PETs;
         
         -- This is a comment
         
         /*This is a comment
         this is  comment
         comment
         many line of comment  */
         
         #Alter Table sytax
         
         ALTER TABLE pet ADD birth_year year; 
         
         ALTER TABLE pet DROP birth_year;
         
         ALTER TABLE pet MODIFY COLUMN death year;
         
         Alter table pet rename column death to death_year;

describe pet;

-- drop table sytax
drop table pet;

select * from pets;

RENAME table pet TO Pets;

INSERT INTO pets (name, owner, species, sex, birth,death_year) 
VALUES ("jimmy", "vimal", "dog", "m","1992-03-22",2023);

INSERT INTO pets (name, owner,  sex, birth, death_year) 
VALUES ("jim", "chris",  "m","1992-03-22",2023);

select * from pets;  

truncate table pets;

-- DR.CAT;  

INSERT INTO pets  VALUES ("tom", "alex", "horse", "f","1993-03-22","1994"),
("jim", "vimalraj", "doggy", "m","1992-03-22","1993"),
("jimmy", "vimal", "dog", "m","1992-03-22","1993");

describe pet;

update pets
set species="cat"
where owner="chris";

SET SQL_SAFE_UPDATES = 0;

update pet
set species="cat"
where owner="alex";

INSERT INTO pet  VALUES ("tommy", "alexi", "doggy", "f","1993-03-22","1994-03-24");

select * from pets;

select name,owner,species from pet;

delete from pets 
where species="doggy" 
and sex="f";

INSERT INTO pets  VALUES ("telex", "alex", "horse","1993-03-22","1994-03-24");

use anadb;

Select * from pet;

describe pet;

set autocommit=0 ;

INSERT INTO pets  VALUES ("telex2", "alex1", "horse","M","1993-03-22","1994");

INSERT INTO pets  VALUES ("telex3", "alex3", "horse3","M","1993-03-22","1994");

select * from pets;

rollback;

commit;

truncate table pets;

/*Insert multiple values and inbetween give savepoint. THen give rollback (rollback to savepoint name)*/
truncate table pets;
set autocommit=0 ;
INSERT INTO pets  VALUES ("tom", "alex", "horse", "f","1993-03-22","1994");
savepoint a;
INSERT INTO pets  VALUES ("jim", "vimalraj", "doggy", "m","1992-03-22","1993");
savepoint b;
INSERT INTO pets  VALUES ("jimmy", "vimal", "dog", "m","1992-03-22","1993");
savepoint c;

rollback to b;

select * from pets where name is null;

alter table pets add unique(owner);

alter table pet add primary key(name);
alter table pets add primary key(species);
ALTER TABLE pets MODIFY name VARCHAR(20) not null;

describe pets;

alter table pet modify sex char(1) not null;

alter table pet modify sex char(1) ;

INSERT INTO pets (name, owner, species,sex, birth, death_year)  
VALUES ("telex1", "vimal1", "dog1","m","1992-03-22",1993);

delete from pets where owner="alex";

alter table pets add CHECK (sex="f");

describe pets;

select * from pets;

drop table pets;

truncate pets;

alter table pets alter sex set default "m";

alter table pets alter sex drop default;
select * from pets;

INSERT INTO pets (name, owner, species,sex, birth, death)  
VALUES ("telex", "vimal", "dog","f","1992-03-22",1993);

INSERT INTO pets (name, owner, species, birth, death)  
VALUES ("telex1", "vimal1", "dog","1992-03-22",1993);

delete from pets where name is null;

create table persons (Pid int not null auto_increment,
lastname varchar(20) not null,
firstname varchar(20) not null,
age int,
primary key (pid));

describe persons;

drop table persons;

insert into persons (lastname,firstname,age)
values("rolex","adam",44);

select * from persons;

insert into persons values("arun","kumar",22);

insert into persons (lastname,firstname,age)
values("vimal","raj",30);

drop table persons;


create table persons (Pid int not null auto_increment,
lastname varchar(20) not null,
firstname varchar(20) not null,
age int,
primary key (pid));

alter table persons auto_increment=100;

alter table persons drop pid;
alter table persons add pid int unsigned not null auto_increment first,
add primary key (pid);

alter table persons add pid int not null auto_increment,
add primary key (pid);

select * from persons;


CREATE TABLE peta (
         name VARCHAR(20) not null, 
         owner VARCHAR(20), 
         species VARCHAR(20), 
         sex CHAR(1), 
         birth DATE, 
         death DATE
         ); 
drop table peta;
describe peta;