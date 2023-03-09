USE ICE_CREAM_SHOP;

CREATE TABLE Customers (
Cust_ID VARCHAR(50) NOT NULL, FirstName VARCHAR(50) NOT NULL, Surname VARCHAR(50) NOT NULL,  Phonenumber VARCHAR(11), DOB VARCHAR(50), Favourite_flavour VARCHAR(50) ) ;

USE ICE_CREAM_SHOP;
INSERT INTO  Customers
 (Cust_ID, FirstName, Surname, Phonenumber, DOB, Favourite_Flavour ) VALUES
( 1, "Helen", "Volrath", "07583657839" ,"10/04/1979" , "Salted Caramel"),
( 2, "Tom", "Smith", "07856479264", "23/04/2000", "Chocolate"),
( 3, "Steven", "Davies", "07839563785", "17/09/2002", "Clotted Cream"),
(4, "Claire", "Moon", "07356893652", "14/11/1997", "Raspberry"),
(5, "Susan", "Time", "07546789201", "25/05/2002", "Salted Caramel"),
(6, "Samantha", "Together", "07652186394", "13/08/1989", "Strawberry"),
(7, "Megan", "Parson", "07890164386", "27/05/2005", "Mint Chocolate Chip"),
(8, "Jack", "Flower", "07895467825", "10/02/1999", "Chocolate"),
(9, "Adam", "Brown", "07894567381", "28/01/1998" , "Strawberry"),
(10, "Rob", "Saturn", "07895623456", "18/01/2003", "Mint Chocolate Chip");

USE ICE_CREAM_SHOP;
SELECT * FROM customers;



USE ICE_CREAM_SHOP;

