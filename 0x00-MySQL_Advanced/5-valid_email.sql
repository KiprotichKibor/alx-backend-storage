-- Task: Create a trigger to reset valid_email when email is changed
-- This trigger will automatically update the valid_email field when email is modified

DELIMITER //

CREATE TRIGGER reset_valid_email
BEFORE UPDATE ON users
FOR EACH ROW
BEGIN
	IF NEW.email != OLD.email THEN
		SET NEW.valid_email = 0;
	END IF;
END;
//

DELIMITER ;
