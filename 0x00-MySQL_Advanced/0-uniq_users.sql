-- Write a SQL script that creates a table users
/***
    Write a SQL script that creates a table users following these requirements:

    With these attributes:
    id, integer, never null, auto increment and primary key
    email, string (255 characters), never null and unique
    name, string (255 characters)
    If the table already exists, your script should not fail
    Your script can be executed on any database
*/

/**** Start mysql container
- service mysql start
- CREATE A DATABASE
- echo "CREATE DATABASE holberton;" | mysql -uroot -p
- implement below
- cat 0-uniq_users.sql | mysql -uroot -p holberton
- insert to it
- echo 'INSERT INTO users (email, name) VALUES ("bob@dylan.com", "Bob");' | mysql -uroot -p holberton
- echo "SELECT * FROM users;" | mysql -uroot -p holberton
*/

CREATE TABLE IF NOT EXISTS users (
    id int NOT NULL AUTO_INCREMENT,
    email VARCHAR(255) NOT NULL UNIQUE,
    name VARCHAR(255),
    PRIMARY KEY (id)
);