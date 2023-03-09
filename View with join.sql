USE ice_cream_shop;
    CREATE VIEW sales
  AS
    SELECT 
    o.idorders,
    f.Flavours,
    concat(C.FirstName," " ,C.Surname) AS FullName
    FROM orders o
    
    INNER JOIN   flavours   f
        ON o.Flavour_ID = f.idFlavours 
        INNER JOIN customers c
        ON o.Cust_ID = c.Cust_ID ;
        
        SElect * from sales ;
        
   
        
        
        