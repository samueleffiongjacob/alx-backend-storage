-- Creates an index idx_name_first on the table names
-- and the first letter of name

--  cat names.sql | mysql -uroot -p holberton
-- mysql -uroot -p holberton
-- SELECT COUNT(name) FROM names WHERE name LIKE 'a%';
-- cat 8-index_my_names.sql | mysql -uroot -p holberton 
-- mysql -uroot -p holberton
-- SHOW index FROM names;
-- SELECT COUNT(name) FROM names WHERE name LIKE 'a%';

CREATE INDEX idx_name_first
ON names(name(1));

/* Write a SQL script that creates an index idx_name_first on the table names and the first letter of name.

Requirements:

Import this table dump: names.sql.zip
Only the first letter of name must be indexed
Context: Index is not the solution for any performance issue, but well used, it’s really powerful!
*/

-- the above name file is now on mega file: https://mega.nz/folder/Kqo1VKQK#WKu2bJ9C_rHiTPaOdTVvmQ