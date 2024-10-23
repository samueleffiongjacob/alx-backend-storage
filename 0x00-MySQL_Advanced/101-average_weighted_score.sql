-- Creates a stored procedure ComputeAverageWeightedScoreForUser
-- that computes and store the average weighted score for all students.

-- cat 101-init.sql | mysql -uroot -p holberton 

DELIMITER $$
DROP PROCEDURE IF EXISTS ComputeAverageWeightedScoreForUsers;
CREATE PROCEDURE ComputeAverageWeightedScoreForUsers()
BEGIN
    UPDATE users set average_score = (SELECT SUM(corrections.score * projects.weight) / SUM(projects.weight)
    FROM corrections
    INNER JOIN projects
    ON projects.id = corrections.project_id
    where corrections.user_id = users.id);
END $$
DELIMITER ;



/* Write a SQL script that creates a stored procedure ComputeAverageWeightedScoreForUsers that computes and store the average weighted score for all students.

Requirements:

Procedure ComputeAverageWeightedScoreForUsers is not taking any input.
Tips:

Calculate-Weighted-Average*/
