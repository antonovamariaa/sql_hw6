DROP FUNCTION even_nums ;


DELIMITER //

CREATE FUNCTION even_nums (num INT)
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
    DECLARE i INT default 0;
    DECLARE result VARCHAR(50) default '';
    
    
    IF num < 0 
		THEN 
        REPEAT
		IF i%2 = 0 AND i!= 0 THEN 
			IF result = '' THEN
				SET result = CONCAT(result, i);
			ELSE
				SET result = CONCAT(result, ',', i);
			END IF;
		END IF;
        
        SET i = i - 1;
        UNTIL i = num - 1 
	END REPEAT;
        
	ELSE 
		
        REPEAT
		IF i%2 = 0 AND i!= 0 THEN 
			IF result = '' THEN
				SET result = CONCAT(result, i);
			ELSE
				SET result = CONCAT(result, ',', i);
			END IF;
		END IF;
        
        SET i = i + 1;
        UNTIL i = num + 1 
	END REPEAT;
     
    END IF;

    RETURN result;
END;
//

DELIMITER ;

select even_nums(10) from dual;