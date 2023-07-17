/*Creation of Customer Table*/
CREATE TABLE customer (
   customer_id INT NOT NULL  PRIMARY KEY,
   FirstName VARCHAR(30),
   LastName VARCHAR(30),
   BirthDay DATE,
   PhoneNumber INT,
   EmailID VARCHAR(50) 
);