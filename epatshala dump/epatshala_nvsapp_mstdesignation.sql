-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: epatshala
-- ------------------------------------------------------
-- Server version	8.1.0

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
-- Table structure for table `nvsapp_mstdesignation`
--

DROP TABLE IF EXISTS `nvsapp_mstdesignation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nvsapp_mstdesignation` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `designationname` varchar(100) NOT NULL,
  `createdon` varchar(50) NOT NULL,
  `createdby` int NOT NULL,
  `softdelete` int NOT NULL,
  `homepage` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nvsapp_mstdesignation`
--

LOCK TABLES `nvsapp_mstdesignation` WRITE;
/*!40000 ALTER TABLE `nvsapp_mstdesignation` DISABLE KEYS */;
INSERT INTO `nvsapp_mstdesignation` VALUES (1,'President','17-07-2023',1000,0,'managementhome'),(2,'Vice President','17-07-2023',1000,0,'managementhome'),(3,'Secretary','17-07-2023',1000,0,'managementhome'),(4,'Joint Secretary','17-07-2023',1000,0,'managementhome'),(5,'Treasurer','17-07-2023',1000,0,'managementhome'),(6,'Executive Member','17-07-2023',1000,0,'memberhome'),(7,'Principal','17-07-2023',1000,0,'principalhome'),(8,'Cashier','17-07-2023',1000,0,'cashierhome'),(9,'Operator','17-07-2023',1000,0,'operatorhome'),(10,'Faculty','17-07-2023',1000,0,'facultyhome'),(11,'Accountant','17-07-2023',1000,0,'accountanthome'),(12,'Librarian','17-07-2023',1000,0,'librarianhome'),(100,'Administrator','17-07-2023',1000,0,'adminhome'),(1000,'Super Administrator','17-07-2023',1000,0,'superadminhome');
/*!40000 ALTER TABLE `nvsapp_mstdesignation` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-16 13:29:37
