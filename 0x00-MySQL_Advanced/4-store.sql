-- Creates a trigger that decreases the quantity
-- of an item after adding a new order
-- New & OLD are MySQL extensions to triggers
-- enable to access columns in the rows affected by a trigger


-- cat 4-init.sql
-- cat 4-init.sql | mysql -uroot -p holberton 
-- cat 4-store.sql | mysql -uroot -p holberton 
-- cat 4-main.sql
-- cat 4-main.sql | mysql -uroot -p holberton 

CREATE TRIGGER decrease_quantity
AFTER INSERT ON orders
FOR EACH ROW
UPDATE items
SET quantity = quantity - NEW.number
WHERE name = NEW.item_name;


/* Write a SQL script that creates a trigger that decreases the quantity of an item after adding a new order.

Quantity in the table items can be negative.

Context: Updating multiple tables for one action from your application can generate issue: network disconnection, crash, etc… to keep your data in a good shape, let MySQL do it for you!
*/