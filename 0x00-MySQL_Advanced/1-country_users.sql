-- Creates a users table with country enum

/**
    continue from previous file 0-uniq_users.sql

    drop db: echo "DROP DATABASE holberton;" | mysql -uroot -p
    create: echo "CREATE DATABASE holberton;" | mysql -uroot -p

    add country, enumeration of countries: US, CO and TN, never null (= default will be the first element of the enumeration, here US)
    cat 1-country_users.sql | mysql -uroot -p holberton
    echo 'INSERT INTO users (email, name, country) VALUES ("bob@dylan.com", "Bob", "US");' | mysql -uroot -p holberton
    echo "SELECT * FROM users;" | mysql -uroot -p holberton
*/

CREATE TABLE IF NOT EXISTS users (
    id int NOT NULL AUTO_INCREMENT,
    email VARCHAR(255) NOT NULL UNIQUE,
    name VARCHAR(255),
    PRIMARY KEY (id),
    country ENUM('US', 'CO', 'TN') DEFAULT 'US' NOT NULL
);
