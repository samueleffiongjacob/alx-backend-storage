-- Creates a trigger that resets the attribute valid_email
-- only when the email has been changed.
-- cat 5-init.sql
-- cat 5-init.sql | mysql -uroot -p holberton
-- cat 5-valid_email.sql | mysql -uroot -p holberton 
-- cat 5-main.sql
-- cat 5-main.sql | mysql -uroot -p holberton 

DELIMITER $$
CREATE TRIGGER new_email
BEFORE UPDATE ON users
FOR EACH ROW
BEGIN
    IF OLD.email != NEW.email THEN
	SET NEW.valid_email = 0;
    END IF;
END$$
DELIMITER ;$$

/* Write a SQL script that creates a trigger that resets the attribute valid_email only when the email has been changed.

Context: Nothing related to MySQL, but perfect for user email validation - distribute the logic to the database itself!
*/