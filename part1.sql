DROP FUNCTION convert_seconds ;


DELIMITER //

CREATE FUNCTION convert_seconds (seconds INT)
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
    DECLARE days INT;
    DECLARE hours INT;
    DECLARE minutes INT;
    DECLARE result VARCHAR(50);

    SET days = seconds DIV 86400;
    SET seconds = seconds % 86400;

    SET hours = seconds DIV 3600;
    SET seconds = seconds % 3600;
	
    
    SET minutes = seconds DIV 60;
    SET seconds = seconds % 60;
	
    SET result = CONCAT (days, ' days ', hours, ' hours ', minutes, ' minutes ', seconds, ' seconds');
    -- SET result = CONCAT (days, 'd', hours, 'h', minutes, 'm', seconds, 's');

    RETURN result;
END;
//

DELIMITER ;

select convert_seconds(654321) from dual;