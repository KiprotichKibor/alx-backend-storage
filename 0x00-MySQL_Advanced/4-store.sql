-- Task: Create a trigger to decrease item quantity after adding a new order
-- This trigger will automatically update the items table when a new order is inserted

DELIMITER //

CREATE TRIGGER decrease_quantity_after_order
AFTER INSERT ON orders
FOR EACH ROW
BEGIN
	UPDATE items
	SET quantity = quantity - NEW.number
	WHERE name = NEW.item_name;
END;
//

DELIMITER ;
