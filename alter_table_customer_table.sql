/*Modifying Customer Table now */
set foreign_key_checks = 0;
ALTER TABLE customer
MODIFY customer_id INT UNSIGNED AUTO_INCREMENT;
set foreign_key_checks = 1;