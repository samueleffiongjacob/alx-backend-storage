-- Creates a view need_meeting that lists all students
-- that have a score under 80 (strict)
-- and no last_meeting or more than 1 month.
-- cat 11-init.sql | mysql -uroot -p holberton
-- cat 11-need_meeting.sql | mysql -uroot -p holberton
-- cat 11-main.sql | mysql -uroot -p holberton

DROP VIEW IF EXISTS need_meeting;
CREATE VIEW need_meeting AS
SELECT name FROM students 
WHERE score < 80
AND (last_meeting IS NULL OR last_meeting < DATE_SUB(NOW(), INTERVAL 1 MONTH));


/* Write a SQL script that creates a view need_meeting that lists all students that have a score under 80 (strict) and no last_meeting or more than 1 month.

Requirements:

The view need_meeting should return all students name when:
They score are under (strict) to 80
AND no last_meeting date OR more than a month*/
