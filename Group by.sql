 USE ice_cream_shop;

      
        USE ice_cream_shop;
SELECT COUNT(Cust_ID), Favourite_flavour
FROM customers
GROUP BY Favourite_flavour;
        