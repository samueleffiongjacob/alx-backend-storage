-- Creates a stored procedure ComputeAverageScoreForUser
-- that computes and stores the average score for a student
-- cat 7-init.sql
-- cat 7-init.sql | mysql -uroot -p holberton 
-- cat 7-average_score.sql | mysql -uroot -p holberton 
-- cat 7-main.sql
--  cat 7-main.sql | mysql -uroot -p holberton 

DELIMITER $$
DROP PROCEDURE IF EXISTS ComputeAverageScoreForUser;
CREATE PROCEDURE ComputeAverageScoreForUser(IN `user_id` INT)
BEGIN 
    UPDATE users
    SET average_score = (SELECT AVG(score)
                        FROM corrections
                        WHERE corrections.user_id = user_id)
    WHERE id = user_id;
END $$
DELIMITER ;$$

/* Write a SQL script that creates a stored procedure ComputeAverageScoreForUser that computes and store the average score for a student. Note: An average score can be a decimal

Requirements:

Procedure ComputeAverageScoreForUser is taking 1 input:
user_id, a users.id value (you can assume user_id is linked to an existing users)
*/