/* ADD new column to address table*/
ALTER TABLE customer_address
ADD Column occupancy_status BOOLEAN DEFAULT 1;
Describe customer_address;

/*DELETE a column from customer_address*/
ALTER TABLE customer_address 
DROP COLUMN occupancy_status;
Describe  customer_address;