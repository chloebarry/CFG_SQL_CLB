 USE ice_cream_shop;

    SELECT 
    o.idorders,
    f.Flavours,
    concat(C.FirstName," " ,C.Surname) AS FullName
    FROM orders o
    
    INNER JOIN   flavours   f
        ON o.Flavour_ID = f.idFlavours 
        INNER JOIN (SELECT * FROM customers WHERE Surname = 'Volrath') c
        ON o.Cust_ID = c.Cust_ID ;
        
       
        
        