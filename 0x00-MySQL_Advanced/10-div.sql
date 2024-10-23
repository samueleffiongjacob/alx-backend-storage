-- Creates a function SafeDiv that divides (and returns)
-- the first by the second number or returns 0
-- if the second number is equal to 0.
-- cat 10-init.sql | mysql -uroot -p holberton
-- cat 10-div.sql | mysql -uroot -p holberton
-- echo "SELECT (a / b) FROM numbers;" | mysql -uroot -p holberton
-- echo "SELECT SafeDiv(a, b) FROM numbers;" | mysql -uroot -p holberton

DELIMITER $$
DROP FUNCTION IF EXISTS SafeDiv;
CREATE FUNCTION SafeDiv(a INT, b INT)
RETURNS FLOAT
BEGIN
    RETURN (IF (b = 0, 0, a / b));
END
$$
DELIMITER ;


/* Write a SQL script that creates a function SafeDiv that divides (and returns) the first by the second number or returns 0 if the second number is equal to 0.

Requirements:

You must create a function
The function SafeDiv takes 2 arguments:
a, INT
b, INT
And returns a / b or 0 if b == 0
*/