-- Creates an index idx_name_first_score on the table
-- names and the first letter of name and the score

-- continue from previous
-- mysql> SELECT COUNT(name) FROM names WHERE name LIKE 'a%' AND score < 80;
-- cat 9-index_name_score.sql | mysql -uroot -p holberton 

CREATE INDEX idx_name_first_score
ON names(name(1), score);


/* Write a SQL script that creates an index idx_name_first_score on the table names and the first letter of name and the score.

Requirements:

Import this table dump: names.sql.zip
Only the first letter of name AND score must be indexed

*/