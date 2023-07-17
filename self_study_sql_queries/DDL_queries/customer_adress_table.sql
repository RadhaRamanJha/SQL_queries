/*Address Table Creation :-*/
CREATE TABLE customer_address (
     customer_id INT NOT NULL,
     full_address VARCHAR(250),
CONSTRAINT pk_cust_add Primary key(customer_id, full_address),
CONSTRAINT fk_cust_add FOREIGN KEY(customer_id) 
REFERENCES customer(customer_id)
 );
