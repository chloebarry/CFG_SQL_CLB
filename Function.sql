SELECT * FROM ice_cream_shop.pot;


USE ICE_CREAM_SHOP;
INSERT INTO pot
 (idPot, Pot_type, StockLevel) VALUES
( 1, "Cone", 10 ),
( 2, "Chocolate cone", 5 ),
( 3, "pot", 20);



USE ICE_CREAM_SHOP;
DELIMITER //

CREATE FUNCTION Stock_level
(
Stock_Level INT)  
RETURNS INT 
DETERMINISTIC
BEGIN	

 DECLARE Pot_type VARCHAR(50) ;
 
  IF Stock_Level < 6 THEN SET pot_type = 'YES';
   ELSEIF (Stock_Level >= 7 ) THEN SET Pot_type = 'MAYBE';
   ELSEIF Stock_Level > 8 THEN SET Pot_type = 'NO';
END IF;
RETURN (Stock_Level);
END//Stock_level_alert
DELIMITER ;


SELECT 
    Pot_type, 
    Stock_level_alert(Stock_level)
    
    FROM
    Pot
ORDER BY 
    Pot_type;
    
    
