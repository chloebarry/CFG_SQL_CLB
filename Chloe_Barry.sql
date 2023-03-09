-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: ice_cream_shop
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary view structure for view `amount_of_2_scoops_sold`
--

DROP TABLE IF EXISTS `amount_of_2_scoops_sold`;
/*!50001 DROP VIEW IF EXISTS `amount_of_2_scoops_sold`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `amount_of_2_scoops_sold` AS SELECT 
 1 AS `Scoop_ID`,
 1 AS `Cost_total`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `Cust_ID` int NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `Surname` varchar(50) NOT NULL,
  `Phonenumber` varchar(11) DEFAULT NULL,
  `DOB` varchar(50) DEFAULT NULL,
  `Favourite_flavour` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Cust_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Helen','Volrath','07583657839','10/04/1979','Salted Caramel'),(2,'Tom','Smith','07856479264','23/04/2000','Chocolate'),(3,'Steven','Davies','07839563785','17/09/2002','Clotted Cream'),(4,'Claire','Moon','07356893652','14/11/1997','Raspberry'),(5,'Susan','Time','07546789201','25/05/2002','Salted Caramel'),(6,'Samantha','Together','07652186394','13/08/1989','Strawberry'),(7,'Megan','Parson','07890164386','27/05/2005','Mint Chocolate Chip'),(8,'Jack','Flower','07895467825','10/02/1999','Chocolate'),(9,'Adam','Brown','07894567381','28/01/1998','Strawberry'),(10,'Rob','Saturn','07895623456','18/01/2003','Mint Chocolate Chip');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flavours`
--

DROP TABLE IF EXISTS `flavours`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flavours` (
  `idFlavours` int NOT NULL,
  `Flavours` varchar(45) NOT NULL,
  PRIMARY KEY (`idFlavours`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flavours`
--

LOCK TABLES `flavours` WRITE;
/*!40000 ALTER TABLE `flavours` DISABLE KEYS */;
INSERT INTO `flavours` VALUES (1,'Salted Caramel'),(2,'Chocolate'),(3,'Clotted cream'),(4,'Raspberry'),(5,'Strawberry'),(6,'Mint Chocolate Chip');
/*!40000 ALTER TABLE `flavours` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `idorders` int NOT NULL,
  `Cust_ID` int NOT NULL,
  `Flavour_ID` int NOT NULL,
  `Pot_ID` int NOT NULL,
  `Scoop_ID` int NOT NULL,
  `FirstName` varchar(45) NOT NULL,
  `Surname` varchar(45) NOT NULL,
  `Phonenumber` varchar(11) DEFAULT NULL,
  `Cost_total` float NOT NULL,
  PRIMARY KEY (`idorders`),
  KEY `idFlavours_idx` (`Flavour_ID`),
  KEY `idScoop_idx` (`Scoop_ID`),
  KEY `idPot_idx` (`Pot_ID`),
  KEY `Cust_ID_idx` (`Cust_ID`),
  CONSTRAINT `Cust_ID` FOREIGN KEY (`Cust_ID`) REFERENCES `customers` (`Cust_ID`),
  CONSTRAINT `idFlavours` FOREIGN KEY (`Flavour_ID`) REFERENCES `flavours` (`idFlavours`),
  CONSTRAINT `idPot` FOREIGN KEY (`Pot_ID`) REFERENCES `pot` (`idPot`),
  CONSTRAINT `idScoop` FOREIGN KEY (`Scoop_ID`) REFERENCES `scoop_amount` (`idScoop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,4,2,2,'Helen','Volrath','07583657839',6.5),(2,2,6,1,3,'Tom','Smith','07856479264',8),(3,6,2,1,2,'Samantha','Together','07652186394',6.5),(5,1,5,3,1,'Helen ','Volrath','07583657839',5),(6,10,3,2,2,'Rob','Saturn','07895623456',6.5),(7,7,1,3,3,'Megan','Parson','07890164386',8);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pot`
--

DROP TABLE IF EXISTS `pot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pot` (
  `idPot` int NOT NULL,
  `Pot_type` varchar(45) NOT NULL,
  `Stock_Level` int NOT NULL,
  PRIMARY KEY (`idPot`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pot`
--

LOCK TABLES `pot` WRITE;
/*!40000 ALTER TABLE `pot` DISABLE KEYS */;
INSERT INTO `pot` VALUES (1,'Cone',7),(2,'Chocolate cone',5),(3,'Pot',20);
/*!40000 ALTER TABLE `pot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `sales`
--

DROP TABLE IF EXISTS `sales`;
/*!50001 DROP VIEW IF EXISTS `sales`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `sales` AS SELECT 
 1 AS `idorders`,
 1 AS `Flavours`,
 1 AS `FullName`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `scoop_amount`
--

DROP TABLE IF EXISTS `scoop_amount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scoop_amount` (
  `idScoop` int NOT NULL,
  `Scoop` varchar(45) NOT NULL,
  `Cost` float NOT NULL,
  PRIMARY KEY (`idScoop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scoop_amount`
--

LOCK TABLES `scoop_amount` WRITE;
/*!40000 ALTER TABLE `scoop_amount` DISABLE KEYS */;
INSERT INTO `scoop_amount` VALUES (1,' Single',5),(2,' Double',6.5),(3,'triple',8);
/*!40000 ALTER TABLE `scoop_amount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'ice_cream_shop'
--
/*!50003 DROP FUNCTION IF EXISTS `Stock_level_alert` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `Stock_level_alert`(
Stock_Level INT) RETURNS varchar(50) CHARSET utf8mb4
    DETERMINISTIC
BEGIN	

 DECLARE Stock_level_alert VARCHAR(50) ;
 
  IF Stock_Level < 6 THEN SET Stock_level_alert = 'YES';
   ELSEIF Stock_Level = 7  THEN SET Stock_level_alert = 'MAYBE';
   ELSEIF Stock_Level > 8  THEN SET Stock_level_alert = 'NO';
END IF;
RETURN (Stock_Level_alert);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertOrder` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertOrder`(
IN idorders INT,
IN Cust_ID INT,
IN Flavour_ID INT,
IN Pot_ID INT,
IN Scoop_ID INT,
IN FirstName VARCHAR(45),
IN Surname VARCHAR(45),
IN Phonenumber VARCHAR(11),
IN Cost_total FLOAT(2)
)
BEGIN
 INSERT INTO Orders( idorders, Cust_ID, Flavour_ID, Pot_ID, Scoop_ID, FirstName, Surname,
Phonenumber, Cost_total )
VALUES ( idorders, Cust_ID, Flavour_ID, Pot_ID, Scoop_ID, FirstName, Surname,
Phonenumber, Cost_total );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `amount_of_2_scoops_sold`
--

/*!50001 DROP VIEW IF EXISTS `amount_of_2_scoops_sold`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `amount_of_2_scoops_sold` AS select `orders`.`Scoop_ID` AS `Scoop_ID`,`orders`.`Cost_total` AS `Cost_total` from `orders` where (`orders`.`Scoop_ID` = '2') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `sales`
--

/*!50001 DROP VIEW IF EXISTS `sales`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `sales` AS select `o`.`idorders` AS `idorders`,`f`.`Flavours` AS `Flavours`,concat(`c`.`FirstName`,' ',`c`.`Surname`) AS `FullName` from ((`orders` `o` join `flavours` `f` on((`o`.`Flavour_ID` = `f`.`idFlavours`))) join `customers` `c` on((`o`.`Cust_ID` = `c`.`Cust_ID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-18 20:29:11
