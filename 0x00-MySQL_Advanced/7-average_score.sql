-- Task: Create a stored procedure ComputeAverageScoreForUser to calculate and store the average score for a student
-- This procedure computes the average score from all corrections for a given user

DELIMITER //

CREATE PROCEDURE ComputeAverageScoreForUser(
	IN p_user_id INT
)
BEGIN
	DECLARE avg_score DECIMAL(5,2);

	-- Compute the average score
	SELECT AVG(score) INTO avg_score
	FROM corrections
	WHERE user_id = p_user_id;

	-- Update the average score for the user
	UPDATE users
	SET average_score = IFNULL(avg_score, 0)
	WHERE id = p_user_id;
END //

DELIMITER ;
