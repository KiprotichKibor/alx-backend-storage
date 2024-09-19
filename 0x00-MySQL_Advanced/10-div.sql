-- Task: Create a function SafeDiv that safely divides two numbers
-- Returns a / b, or 0 if b is 0

DELIMITER //

CREATE FUNCTION SafeDiv(a INT, b INT)
RETURNS DECIMAL(10, 4)
DETERMINISTIC
BEGIN
    DECLARE result DECIMAL(10, 4);
    
    IF b = 0 THEN
        SET result = 0;
    ELSE
        SET result = a / b;
    END IF;
    
    RETURN result;
END //

DELIMITER ;
